import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Model/AttractionModel.dart';

Future<List<AttractionModel>> fetchAttractions(http.Client client) async {
  var url =
      "https://tripadvisor1.p.rapidapi.com/attractions/list?location_id=293928";
  var key = "";

  final response = await client.get(url, headers: {
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
