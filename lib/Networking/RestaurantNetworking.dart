import 'dart:async';
import 'dart:convert';
import 'package:touristadvisor/constants.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Model/RestaurantModel.dart';

Future<RestaurantModel> fetchRestaurant(int locationId, String languageCode) async {

  var url = "https://tripadvisor1.p.rapidapi.com/restaurants/get-details?location_id=";
  url += locationId.toString();
  url += "&lang=";
  url += languageCode;

  final response = await http.get(url, headers: {
  "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
  "x-rapidapi-key": APIKey
  });

  return compute(parseRestaurants, response.body);

}

RestaurantModel parseRestaurants(String responseBody) {
  var data = json.decode(responseBody);
  return RestaurantModel.fromJson(data);
}