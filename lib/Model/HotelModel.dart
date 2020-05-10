
import 'dart:ffi';

class HotelModel {
//  final int location_id;
//  final String name;
//  final double latitude;
//  final double longitude;
//  final int numReviews;
//  final double rating;
//  final String priceLevel;
//  final String price;
//  final double hotelClass;
//  final String phone;
//  final String website;
//  final String photoUrl;
//  final String description;
//  final String address;
//  final String email;

  int location_id;
  String name;
  double latitude;
  double longitude;
  int numReviews;
  double rating;
  String priceLevel;
  String price;
  double hotelClass;
  String phone;
  String website;
  String photoUrl;
  String description;
  String address;
  String email;

  HotelModel( {
    this.location_id,
    this.name,
    this.latitude,
    this.longitude,
    this.numReviews,
    this.rating,
    this.priceLevel,
    this.price,
    this.hotelClass,
    this.phone,
    this.website,
    this.photoUrl,
    this.description,
    this.address,
    this.email
//    AWARDS?

  });

  HotelModel.example(){
    location_id = 277359;
    name = "Radisson Blu Hotel Krakow";
    latitude = 50.058437;
    longitude = 19.933285;
    numReviews = 3581;
    rating = 4.5;
    priceLevel = "\$\$";
    price = "\$87 - \$210";
    hotelClass = 5.0;
    phone = "01148126188888";
    website = "http://www.radissonblu.com/hotel-krakow";
    photoUrl = "https://media-cdn.tripadvisor.com/media/photo-s/19/d8/3d/11/radisson-blu-hotel-krakow.jpg";
    description = "Radisson Blu Hotel Krakow is located next to the Planty Park; in the centre of Krakow. Main Market Square and the Royal Wawel Castle are only few steps away. This hotel offers 196   comfortable guest rooms; two great restaurants; including Milk&Co with amazing fish and seafood buffet. Guests can use here fitness center; beauty studio and eight professional meeting rooms. Free bicycles are available. This is an ideal choice for both business guests and tourists.";
    address = "ul. Floriana Straszewskiego 17; Krakow 31-109 Poland";
    email = "info.krakow@radissonblu.com";
  }

  factory HotelModel.fromJson(Map<String, dynamic> json) {
      return HotelModel (
        location_id: json['location_id'] as int,
        name: json['name'] ?? "",
        latitude: double.parse(json["longitude"] ?? "0"),
        longitude: double.parse(json["longitude"] ?? "0"),
        numReviews: int.parse(json["num_reviews"] ?? '0'),
        rating: double.parse(json["rating"] ?? '0'),
        priceLevel: json['price_level'] ?? "",
        price: json['price'] ?? "",
        hotelClass: double.parse(json["hotel_class"] ?? "0"),
        phone: json['phone'] ?? "",
        website: json['website'] ?? "",
        photoUrl: json['photo']['images']['medium']['url'] ?? "",
        description: json["description"] ?? "",
        address: json["address"] ?? "",
        email: json["email"] ?? ""
      );
  }
}