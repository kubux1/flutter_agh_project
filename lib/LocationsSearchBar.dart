import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'Model/LocationModel.dart';
import 'package:touristadvisor/AttractionDetails.dart';

class LocationsSearchBar extends StatelessWidget {
  static int kmRadius = 1;
  static List<String> checkedBoxes;

  Future<List<LocationModel>> search(String search) async {
    Future<List<LocationModel>> locations = loadLocations();
    return locations;
  }

  onLocationTap(LocationModel location, BuildContext context) {
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
        child: SearchBar<LocationModel>(
          hintText: "Name of cities, districts, places, etc…",
          onSearch: search,
          onItemFound: (LocationModel location, int index) {
            return ListTile(
              title: Text(location.name),
              subtitle: Text(location.rating.toString()),
              onTap: () => onLocationTap(location, context),
            );
          },
          loader: Text("Searching..."),
          debounceDuration: Duration(milliseconds: 1000),
          emptyWidget: Center(
            child: Text("No results found"),
          ),
          onError: (error) {
            return Center(
              child: Text("Error occurred : $error"),
            );
          },
        ),
      )),
    );
  }
}
