import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:touristadvisor/Model/ILocationModel.dart';
import 'package:touristadvisor/Networking/LocationNetworking.dart';

import '../Locale/I18n.dart';
import '../Model/LocationModel.dart';

class LocationsSearchBar extends StatelessWidget {
  static int kmRadius = 1;
  static List<LocationType> selectedLocations = new List();
  BuildContext context;

  Future<List<LocationModel>> search(String search) async {
//    Future<List<LocationModel>> locations =
//        loadLocations(selectedLocations, kmRadius);

    Future<List<LocationModel>> locations = fetchLocations(search, selectedLocations, kmRadius);
    // to jak juz bedziemy miec skonczone
    return locations;
  }

  onLocationTap(LocationModel location, BuildContext context) {
    location.showDetails(location.locationType, location.id, context);
  }

  static onCheckBoxSelected(List<String> selectedParams) {
    selectedLocations = [];
    for (String str in selectedParams) {
      selectedLocations.add(getLocationType(str));
    }
  }

  static onSliderMoved(int kmValue) {
    kmRadius = kmValue;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<LocationModel>(
          hintText: AdvisorLocalizations.of(context).locationsSearchBarHintText,
          onSearch: search,
          onItemFound: (LocationModel location, int index) {
            return ListTile(
              title: Text(location.name),
              subtitle: Text(AdvisorLocalizations.of(context).distance +
                  location.distance.round().toString() +
                  "km\t \t" +
                  AdvisorLocalizations.of(context).rating +
                  location.rating.toString()),
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
                child: Text(
                    AdvisorLocalizations.of(context).errorOccurred(error)));
          },
        ),
      )),
    );
  }
}
