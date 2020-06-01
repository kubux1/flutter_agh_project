import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touristadvisor/DetailView/RestaurantDetails.dart';
import 'package:touristadvisor/Model/DictionaryEntry.dart';
import 'package:touristadvisor/Model/LocationModel.dart';
import 'ILocationModel.dart';
import 'package:touristadvisor/Model/PhotoModel.dart';

class RestaurantModel extends LocationModel{
  final LocationType locationType = LocationType.restaurant;
  int id;
  String name;
  double latitude;
  double longitude;
  int numReviews;
  double rating;
  String priceLevel;
  String price;
  String photoUrl;
  List<String> cuisine;
  String menu;
  String address;
  String phoneNumber;
  String website;
  String email;
  double distance;

  RestaurantModel(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.numReviews,
        this.rating,
        this.priceLevel,
        this.price,
        this.phoneNumber,
        this.website,
        this.photoUrl,
        this.address,
        this.email,
        this.cuisine,
        this.menu,
        this.distance
      });

//  RestaurantModel.example() {
//    id = 17820063;
//    name = "Mister Lai Restaurant";
//    latitude = 12.240815;
//    longitude = 109.19601;
//    numReviews = 51;
//    rating = 3;
//    priceLevel = "\$";
//    price = "\$5 - \$20";
//    phoneNumber = "+84 90 673 80 36";
//    website = "https://www.facebook.com/misterlainhatrang/";
//    photoUrl = "https://media-cdn.tripadvisor.com/media/photo-f/19/66/c7/c0/dimsum-table.jpg";
//    address = "44 Tran Phu AB Central Square, Loc Tho, Nha Trang 650000 Vietnam";
//    email = "reservation.misterlai@gmail.com";
//    cuisine = ["Chinese", "Asian", "Vegan Options"];
//    menu = "https://www.facebook.com/misterlainhatrang/menu/";
//    distance = 10;
//  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
        id: int.parse(json['location_id']),
        name: json['name'] ?? "",
        latitude: double.parse(json["longitude"] ?? "0"),
        longitude: double.parse(json["longitude"] ?? "0"),
        numReviews: int.parse(json["num_reviews"] ?? '0'),
        rating: double.parse(json["rating"] ?? '0'),
        priceLevel: json['price_level'] ?? "",
        price: json['price'] ?? "",
        phoneNumber: json['phone'] ?? "",
        website: json['website'] ?? "",
        photoUrl: json['photo']['images']['medium']['url'] ?? "",
        address: json["address"] ?? "",
        distance: double.parse(json['distance'] ?? "0.0"),
        cuisine: (json['cuisine'] as List).map((x) {return DictionaryEntry.fromJson(x).name;}).toList(),
        menu: json['menu_web_url'] ?? "",
        email: json["email"] ?? "");
  }

}
