
import 'dart:ffi';
import '../Networking/AttractionNetworking.dart';

class AttractionModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int numReviews;
//  add photo
  final String description;
  final String address;
  final String phoneNumber;
//  add webpage
  final String email;

  AttractionModel({this.id, this.name, this.latitude, this.longitude, this.numReviews, this.description, this.address, this.phoneNumber, this.email});

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
      return AttractionModel (
        id: json['id'] as int,
        name: json['name'] ?? "",
        latitude: double.parse(json["longitude"] ?? "0"),
        longitude: double.parse(json["longitude"] ?? "0"),
        numReviews: int.parse(json["num_reviews"] ?? '0'),
        description: json["description"] ?? "",
        address: json["adress"] ?? "",
        email: json["email"] ?? ""
      );
  }
}