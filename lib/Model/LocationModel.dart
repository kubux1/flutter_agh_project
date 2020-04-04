
import 'dart:ffi';
import 'dart:math';
import 'dart:convert' show json, jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';

class LocationModel {
  final int id;
  final String name;
  final double distance;
  final double rating;
  final bool isClosed;

  LocationModel({this.id, this.name, this.distance, this.rating, this.isClosed});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel (
        id: int.parse(json['location_id']),
        name: json['name'] ?? "",
        distance: (1.0 + 29.0 *Random().nextDouble()),
        rating: double.parse(json['rating'] ?? 0.0),
        isClosed: json['is_closed']
    );
  }
}

//MOCK FROM FILE "church" response
Future<String> _loadLocationsAsset() async {
  return await rootBundle.loadString('assets/searchResponse.json');
}

Future<List<LocationModel>> loadLocations() async {

  String jsonLocationsOverall = await _loadLocationsAsset();
  var data = jsonDecode(jsonLocationsOverall);
  var parsed = data["data"] as List;

  List<dynamic> locationList = new List<dynamic>(); // json response is ['data'][0]['result_object']
  for (var location in parsed) {
    locationList.add(location['result_object']);
  }


  List<LocationModel> locations = await locationList.map<LocationModel>((json) => LocationModel.fromJson(json)).toList();
  print(locations[0].name);
  return locations;
}
