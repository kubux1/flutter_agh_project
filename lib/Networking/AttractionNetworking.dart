import 'dart:async';
import 'dart:convert';
import 'package:touristadvisor/constants.dart';

import '../Model/AttractionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';

  Future<AttractionModel> fetchAttractions(int locationId, String languageCode) async {
    var url = "https://tripadvisor1.p.rapidapi.com/attractions/get-details?location_id=";
    url += locationId.toString();
    url += "&lang=";
    url += languageCode;

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

