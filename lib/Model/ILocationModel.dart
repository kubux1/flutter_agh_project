import 'package:flutter/cupertino.dart';

abstract class ILocationModel {
  final int id;
  final String name;
  final double distance;
  final double rating;
  final bool isClosed;
  final LocationType locationType;

  ILocationModel(
      {this.id,
      this.name,
      this.distance,
      this.rating,
      this.isClosed,
      this.locationType});
}

enum LocationType { airport, hotel, restaurant, attraction }
