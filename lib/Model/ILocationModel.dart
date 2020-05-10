abstract class ILocationModel {
  final int id;
  final String name;
  final double distance;
  final double rating;
  final bool isClosed;

  ILocationModel({this.id, this.name, this.distance, this.rating, this.isClosed});
}

enum LocationType {
  airport,
  hotel,
  attraction,
}