import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Model/AttractionModel.dart';

Future<List<AttractionModel>> fetchAttractions(http.Client client, int locationId) async {
  var uri = Uri.https("tripadvisor1.p.rapidapi.com", "/attractions/get-details", {
    "location_id": locationId.toString() // "293928",
  });
  var key = "";

  final response = await client.get(uri, headers: {
    "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
    "x-rapidapi-key": key
  });

  return compute(parseAttractions, response.body);
}

List<AttractionModel> parseAttractions(String responseBody) {
  var data = json.decode(responseBody);
  var parsed = data["data"] as List;

  return parsed
      .map<AttractionModel>((json) => AttractionModel.fromJson(json))
      .toList();
}
