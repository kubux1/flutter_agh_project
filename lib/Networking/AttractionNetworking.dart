
import 'dart:async';
import 'dart:convert';
import '../Model/AttractionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


  Future<AttractionModel> fetchAttractions() async {
    var url = "https://tripadvisor1.p.rapidapi.com/attractions/get-details?location_id=293928";
    var key = "";

    final response = await http.get(url, headers: {
      "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
      "x-rapidapi-key": key
    });

    return compute(parseAttractions, response.body);

  }

  AttractionModel parseAttractions(String responseBody) {
    var data = json.decode(responseBody);
    return AttractionModel.fromJson(data);
  }

