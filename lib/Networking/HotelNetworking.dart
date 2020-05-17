import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:touristadvisor/constants.dart';

import '../Model/HotelModel.dart';

Future<List<HotelModel>> fetchHotel(http.Client client, String currency,
    String lang, String checkinDate, int locationId) async {
  var uri = Uri.https("tripadvisor1.p.rapidapi.com", "/hotels/get-details", {
    "adults": "1",
    "nights": "2",
    "currency": currency,
    "lang": lang,
    "checkin": checkinDate,
    "location_id": locationId.toString() // "277359",
  });

  final response = await client.get(uri, headers: {
    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
    "x-rapidapi-key": APIKey
  });

  return compute(parseHotel, response.body);
}

List<HotelModel> parseHotel(String responseBody) {
  var data = json.decode(responseBody);
  var parsed = data["data"] as List;

  return parsed.map<HotelModel>((json) => HotelModel.fromJson(json)).toList();
}
