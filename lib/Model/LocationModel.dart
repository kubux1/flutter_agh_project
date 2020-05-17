import 'dart:convert' show jsonDecode;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'AirportModel.dart';
import 'HotelModel.dart';
import 'ILocationModel.dart';

class LocationModel implements ILocationModel {
  final int id;
  final String name;
  final double distance;
  final double rating;
  final bool isClosed;
  bool isFavourite = false;
  final LocationType locationType;

  LocationModel(
      {this.id,
      this.name,
      this.distance,
      this.rating,
      this.isClosed,
      this.locationType});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        id: int.parse(json['location_id']),
        name: json['name'] ?? "",
        distance: (1.0 + 29.0 * Random().nextDouble()),
        rating: double.parse(json['rating'] ?? 0.0),
        isClosed: json['is_closed'],
        locationType: LocationType.attraction);
  }

  @override
  goToDetailedView(BuildContext context, int locationId) {
    // TODO: implement goToDetailedView
    throw UnimplementedError();
  }
}

//MOCK FROM FILE "church" response
Future<String> _loadLocationsAsset() async {
  return await rootBundle.loadString('assets/searchResponse.json');
}

Future<List<LocationModel>> loadLocations(
    List<String> selectedLocations, int kmRadius) async {
  String jsonLocationsOverall = await _loadLocationsAsset();
  var data = jsonDecode(jsonLocationsOverall);
  var parsed = data["data"] as List;

  List<dynamic> locationList =
      new List<dynamic>(); // json response is ['data'][0]['result_object']
  for (var location in parsed) {
    locationList.add(location['result_object']);
  }

  List<LocationModel> locations = await locationList
      .map<LocationModel>((json) => LocationModel.fromJson(json))
      .toList();

  final AirportModel airportModel = new AirportModel.example();
  final HotelModel hotelModel = new HotelModel.example();
  locations.add(hotelModel);
  locations.add(airportModel);

  return locations;
}
