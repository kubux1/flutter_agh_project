import 'dart:async';
import 'dart:convert';
import 'package:touristadvisor/constants.dart';

import '../Model/AttractionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


  Future<AttractionModel> fetchAttractions(String locationId) async {
    var url = "https://tripadvisor1.p.rapidapi.com/attractions/get-details?location_id=";
    url += locationId;

    final response = await http.get(url, headers: {
      "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
      "x-rapidapi-key": APIKey
    });

    return compute(parseAttractions, response.body);

  }

  AttractionModel parseAttractions(String responseBody) {
    var data = json.decode(responseBody);
    return AttractionModel.fromJson(data);
  }

