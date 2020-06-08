import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touristadvisor/DetailView/AttractionDetails.dart';
import 'package:touristadvisor/Model/LocationModel.dart';

import 'ILocationModel.dart';

import 'dart:ffi';
import 'package:touristadvisor/Model/PhotoModel.dart';

import '../Networking/AttractionNetworking.dart';

class AttractionModel extends LocationModel{
  final LocationType locationType = LocationType.attraction;
  String url;
  int id;
  String name;
  double latitude;
  double longitude;
  int numReviews;
  double rating;
  String photoUrl;
  String description;
  String address;
  String phoneNumber;
  String website;
  String email;
  double distance;

  AttractionModel({
      this.url,
      this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.numReviews,
      this.rating,
      this.photoUrl,
      this.description,
      this.address,
      this.phoneNumber,
      this.website,
      this.email,
      this.distance});

  AttractionModel.example(){
    id = 276808;
    name = "Matthias Church";
    latitude = 47.501984;
    longitude = 19.034206;
    numReviews = 15262;
    rating = 4;
    photoUrl = 'https://media-cdn.tripadvisor.com/media/photo-s/08/c2/f8/f2/bucket-list-de-budapeste.jpg';
    description = 'Used over the centuries as a coronation church for the Hungarian kings, the slender and graceful architecture of this beautiful church dominates the main square of the Castle area.';
    address = 'Szentharomsag ter 2, Budapest 1014 Hungary';
    phoneNumber = '+36 1 355 5657';
    website = 'http://matyas-templom.hu';
    email = 'plebania@matyas-templom.hu';
    distance = 10;
  }

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
        id: json['id'] as int,
        name: json['name'] ?? "",
        latitude: double.parse(json["longitude"] ?? "0"),
        longitude: double.parse(json["longitude"] ?? "0"),
        numReviews: int.parse(json["num_reviews"] ?? '0'),
        rating: double.parse(json["rating"] ?? '0'),
        photoUrl: json['photo']['images']['medium']['url'] ?? "",
        description: json["description"] ?? "",
        address: json["address"] ?? "",
        phoneNumber: json["phone"] ?? "",
        website: json['website'] ?? "",
        email: json["email"] ?? "",
        distance: double.parse(json['distance'] ?? "0.0"),
        url: PhotoModel.fromJson(json["photo"]).images.photo.url ?? ""
    );
  }

  @override
  goToDetailedView(BuildContext context, int locationId) {
    //TODO: Get a specific object from API or cache
    final AttractionModel attractionModel = new AttractionModel.example();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AttractionDetails(locationId)));
  }
}
