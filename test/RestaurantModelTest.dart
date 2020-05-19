import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:touristadvisor/Model/RestaurantModel.dart';

void main(){
  final jsonString = """
  {
   "cuisine":[
      {
         "key":"5379",
         "name":"Chinese"
      },
      {
         "key":"10659",
         "name":"Asian"
      },
      {
         "key":"10697",
         "name":"Vegan Options"
      }
   ]
}
  """;

  test('Cuisine parsed', () {
    final data = json.decode(jsonString);
    final restaurant = RestaurantModel.fromJson(data);
    expect(restaurant.cuisine.length, 3);
  });
}