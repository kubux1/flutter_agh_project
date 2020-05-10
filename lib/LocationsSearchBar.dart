import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'I18n.dart';
import 'package:touristadvisor/AttractionDetails.dart';
import 'Model/ILocationModel.dart';
import 'Model/LocationModel.dart';

class LocationsSearchBar extends StatelessWidget {
  static int kmRadius = 1;
  static List<String> checkedBoxes;

  Future<List<ILocationModel>> search(String search) async {
    Future<List<ILocationModel>> locations = loadLocations();
    return locations;
  }

  onLocationTap(ILocationModel location, BuildContext context) {
    print(location.toString() + kmRadius.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AttractionDetails())
    );
  }

  static onCheckBoxSelected(List<String> selectedParams) {
    checkedBoxes = selectedParams;
  }

  static onSliderMoved(int kmValue) {
    kmRadius = kmValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<ILocationModel>(
          hintText: AdvisorLocalizations.of(context).locationsSearchBarHintText,
          onSearch: search,
          onItemFound: (ILocationModel location, int index) {
            return ListTile(
              title: Text(location.name),
              subtitle: Text("Rating: " + location.rating.toString() +
                  "\nDistance: " + location.distance.round().toString() + "km"),
              onTap: () => onLocationTap(location, context),
            );
          },
          loader: Text(AdvisorLocalizations.of(context).searching),
          debounceDuration: Duration(milliseconds: 1000),
          emptyWidget: Center(
            child: Text(AdvisorLocalizations.of(context).noResultsFound),
          ),
          onError: (error) {
            return Center(
              child: Text(AdvisorLocalizations.of(context).errorOccurred(error))
            );
          },
        ),
      )),
    );
  }
}
