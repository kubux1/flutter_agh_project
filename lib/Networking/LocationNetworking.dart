
import 'dart:async';
import 'dart:convert';
import 'package:touristadvisor/constants.dart';

import '../Model/LocationModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<LocationModel>> fetchLocations(String query) async {
  var url = "https://tripadvisor1.p.rapidapi.com/locations/search?query=";
  url += query;
  final response = await http.get(url, headers: {
    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
    "x-rapidapi-key": APIKey
  });

  return compute(parseLocations, response.body);

}

List<LocationModel> parseLocations(String responseBody) {
  var data = json.decode(responseBody);

  var parsed = data["data"] as List;

  List<dynamic> locationList = new List<dynamic>(); // json response is ['data'][0]['result_object']
  for (var location in parsed) {
    locationList.add(location['result_object']);
  }

  return locationList.map<LocationModel>((json) => LocationModel.fromJson(json)).toList();
}

