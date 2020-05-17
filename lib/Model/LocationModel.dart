import 'dart:convert' show jsonDecode;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'AirportModel.dart';
import 'HotelModel.dart';
import 'ILocationModel.dart';

abstract class LocationDetailsStrategy {
  showDetails(LocationType locationType);
}



class LocationDetailsPresent {
  LocationDetailsStrategy locationDetailsStrategy;

  showDetails(LocationType locationType) {

    locationDetailsStrategy.showDetails(locationType);
  }
}

class AttractionDetailsPresent implements LocationDetailsStrategy {
  @override
  showDetails(LocationType locationType) {
    // TODO: implement showDetails
    print("pokazujemy atrakcje");
    throw UnimplementedError();
  }
}

class RestaurantDetailsPresent implements LocationDetailsStrategy {
  @override
  showDetails(LocationType locationType) {
    // TODO: implement showDetails
    print("pokazujemy restauracje");
    throw UnimplementedError();
  }
}

class HotelDetailsPresent implements LocationDetailsStrategy {
  @override
  showDetails(LocationType locationType) {
    // TODO: implement showDetails
    print("pokazujemy hotele");
    throw UnimplementedError();
  }
}

class AirportDetailsPresent implements LocationDetailsStrategy {
  @override
  showDetails(LocationType locationType) {
    // TODO: implement showDetails
    print("pokazujemy lotniska");
    throw UnimplementedError();
  }
}


class CategoryModel {
  final String key;
  final String name;

  CategoryModel({this.key, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel (
        name: json['name'] ?? "",
        key: json['key'] ?? ""
    );
  }
}


class LocationModel implements ILocationModel {
  final int id;
  final String name;
  final double distance;
  final double rating;
  final bool isClosed;
  final LocationType locationType;
//  final CategoryModel category;

  LocationModel(
      {this.id,
      this.name,
      this.distance,
      this.rating,
      this.isClosed,
      this.locationType,
//      this.categoryModel
      });

  factory LocationModel.fromJson(Map<String, dynamic> json) {

    return LocationModel(
        id: int.parse(json['location_id']),
        name: json['name'] ?? "",
        distance: (1.0 + 29.0 * Random().nextDouble()),
        rating: double.parse(json['rating'] ?? 0.0),
        isClosed: json['is_closed'],
        locationType: getLocationType(CategoryModel.fromJson(json['category']).key)
    );
//        category
  }

  @override
  goToDetailedView(BuildContext context, int locationId) {
    showDetails(locationType);
  }

}


showDetails(LocationType locationType) {
  switch(locationType) {


    case LocationType.attraction: {  print("pokazujemy attraction"); }
    break;

    case LocationType.restaurant: {  print("pokazujemy restaurant"); }
    break;

    case LocationType.hotel: { print("pokazujemy hotel");  }
    break;

    case LocationType.restaurant: {  print("pokazujemy restaurant");  }
    break;

    default: { print("pokazujemy nie wiem co"); }
    break;
  }
}

LocationType getLocationType(String category) {
  switch(category) {
    case "hotel": {  return LocationType.hotel; }
    break;

    case "attraction": { return LocationType.attraction; }
    break;

    case "restaurant": {  return LocationType.restaurant; }
    break;

    case "airport": {  return LocationType.airport;  }
    break;

    default: { return LocationType.attraction; }
    break;
  }
}

//MOCK FROM FILE "church" response
Future<String> _loadLocationsAsset() async {
  return await rootBundle.loadString('assets/searchResponse.json');
}

Future<List<LocationModel>> loadLocations(
    List<String> selectedLocations, int kmRadius) async {
  String jsonLocationsOverall = await _loadLocationsAsset();
  var data = jsonDecode(jsonLocationsOverall);
  var parsed = data["data"] as List;

  List<dynamic> locationList =
      new List<dynamic>(); // json response is ['data'][0]['result_object']
  for (var location in parsed) {
    locationList.add(location['result_object']);
  }


// List<LocationModel> locations = await locationList
    //  .map<LocationModel>((json) => LocationModel.fromJson(json))
  //    .toList();

//  final AirportModel airportModel = new AirportModel.example();
  //final HotelModel hotelModel = new HotelModel.example();
  //locations.add(hotelModel);
//  locations.add(airportModel);
  
  List<LocationModel> locations = await locationList.map<LocationModel>((json) => LocationModel.fromJson(json)).toList();
  return locations;
}
