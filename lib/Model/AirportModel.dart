import 'ILocationModel.dart';

class AirportModel implements ILocationModel {
  final LocationType locationType = LocationType.airport;
  int id;
  String name;
  double distance;
  double rating;
  bool isClosed;
  String code;
  String city_name;
  String country_code;
  String state;
  String display_name;
  int location_id;
  String time_zone_name;
  double latitude;
  double longitude;
  String parent_code;

  AirportModel(
      {this.id,
      this.name,
      this.distance,
      this.rating,
      this.isClosed,
      this.code,
      this.city_name,
      this.country_code,
      this.state,
      this.display_name,
      this.location_id,
      this.time_zone_name,
      this.latitude,
      this.longitude,
      this.parent_code});

  AirportModel.example() {
    code = "JFK";
    city_name = "New York City";
    country_code = "US";
    name = "John F.Kennedy Intl Airport";
    state = "NY";
    display_name = "John F.Kennedy Intl Airport(JFK)";
    location_id = 277359;
    latitude = 40.6435529;
    longitude = -73.78211390000001;
    parent_code = "NYC";
  }

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
        code: json['code'] ?? "",
        city_name: json['city_name'] ?? "",
        country_code: json['country_code'] ?? "",
        name: json['name'] ?? "",
        state: json['state'] ?? "",
        display_name: json['display_name'] ?? "",
        location_id: json['location_id'] as int,
        time_zone_name: json['time_zone_name'] ?? "",
        latitude: double.parse(json["longitude"] ?? "0"),
        longitude: double.parse(json["longitude"] ?? "0"),
        parent_code: json['parent_code'] ?? "");
  }
}
