
import 'dart:async';
import 'dart:convert';
import '../Model/AttractionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttractionNetworking {

  Future<http.Response> fetchAttraction(http.Client client) async {
    var url = "https://tripadvisor1.p.rapidapi.com/attractions/list";
    var key = "996cAicWvnmshdNtgDog4ZQCMhe4p1R2OOljsne0ZBmON1Gqut";

    return await client.get(url, headers: {
      "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
      "x-rapidapi-key": "996cAicWvnmshdNtgDog4ZQCMhe4p1R2OOljsne0ZBmON1Gqut"
    });

  }

  Future<List<AttractionModel>> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<AttractionModel>((json) => AttractionModel.fromJson(json)).toList();
  }

}