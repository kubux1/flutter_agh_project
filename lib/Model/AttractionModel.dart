
import 'dart:ffi';
import 'Networking/AttractionNetworking.dart';

class AttractionModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int numReviews;
  final String description;
  final String address;
  final String phoneNumber;
  final String email;

  AttractionModel({this.id, this.name, this.latitude, this.longitude, this.numReviews, this.description, this.address, this.phoneNumber, this.email});

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
      return AttractionModel (
        id: json['id'] as int,
        name: json['name'] as String,
        latitude: json["latitude"] as double,
        longitude: json["longitude"] as double,
        numReviews: json["num_reviews"] as int,
        description: json["description"] as String,
        address: json["adress"] as String,
        email: json["email"] as String
      );
  }
}