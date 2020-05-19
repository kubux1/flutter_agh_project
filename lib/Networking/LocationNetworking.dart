
import 'dart:async';
import 'dart:convert';
import 'package:touristadvisor/Model/ILocationModel.dart';
import 'package:touristadvisor/constants.dart';

import '../Model/LocationModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<LocationModel>> fetchLocations(String query, List<LocationType> selectedLocation, int radius ) async {
  var url = "https://tripadvisor1.p.rapidapi.com/locations/search?query=";
  url += query;
  final response = await http.get(url, headers: {
    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
    "x-rapidapi-key": APIKey
  });

  Map map = Map();
  map['body'] = response.body;
  map['selectedLocations'] = selectedLocation;
  map['radius'] = radius;

  return compute(parseLocations, map);

}

List<LocationModel> parseLocations(map) {
  var responseBody = map['body'];
  var selectedLocations = map['selectedLocations'] as List<LocationType>;
  var radius = map['radius'];
  var data = json.decode(responseBody);

  var parsed = data["data"] as List;

  List<dynamic> locationList = new List<dynamic>(); // json response is ['data'][0]['result_object']
  for (var location in parsed) {
//    if l
   var locationModel = LocationModel.fromJson(location['result_object']);
     if (radius <= locationModel.distance) {
       if(selectedLocations.contains(locationModel.locationType) || selectedLocations.isEmpty) {
         locationList.add(location['result_object']);
       }
    }
  }


  return locationList.map<LocationModel>((json) => LocationModel.fromJson(json)).toList();
}

