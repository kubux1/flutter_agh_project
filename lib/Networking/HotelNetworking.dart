import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:touristadvisor/constants.dart';

import '../Model/HotelModel.dart';

//Future<List<HotelModel>> fetchHotels(http.Client client, String currency,
//    String lang, String checkinDate, int locationId) async {
//
//  var uri = Uri.https("tripadvisor1.p.rapidapi.com", "/hotels/get-details", {
//    "adults": "1",
//    "nights": "2",
//    "currency": currency,
//    "lang": lang,
//    "checkin": checkinDate,
//    "location_id": locationId.toString() // "277359",
//  });
//
//  final response = await client.get(uri, headers: {
//    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
//    "x-rapidapi-key": APIKey
//  });
//
//  return compute(parseHotels, response.body);
//}
//
//List<HotelModel> parseHotels(String responseBody) {
//  var data = json.decode(responseBody);
//  var parsed = data["data"] as List;
//
//  return parsed.map<HotelModel>((json) => HotelModel.fromJson(json)).toList();
//}

Future<HotelModel> fetchHotel(int locationId, String languageCode) async {
  var url = "https://tripadvisor1.p.rapidapi.com/hotels/get-details?location_id=";
  url += locationId.toString();
  url += "&lang=";
  url += languageCode;

  final response = await http.get(url, headers: {
    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
    "x-rapidapi-key": APIKey
  });

  print(response.body);
  return compute(parseHotel, response.body);
}

HotelModel parseHotel(String responseBody) {
  var data = json.decode(responseBody);
  var parsed = data["data"] as List;
  return HotelModel.fromJson(parsed.first);
}