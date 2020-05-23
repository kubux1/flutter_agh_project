import 'dart:typed_data';

import 'package:touristadvisor/Favorites/Command.dart';
import 'package:touristadvisor/Model/HotelModel.dart';

import '../FavoritesDB.dart';

class AddFavoriteHotelCommand implements Command{
  final FavoritesDB _favoritesDB;
  final HotelModel _hotelModel;

  AddFavoriteHotelCommand(this._favoritesDB, this._hotelModel);

  FavoriteHotel get _favoriteHotel => FavoriteHotel(
    location_id: _hotelModel.location_id,
    name: _hotelModel.name,
    latitude: _hotelModel.latitude,
    longitude: _hotelModel.longitude,
    rating: _hotelModel.rating,
    price: _hotelModel.price,
    priceLevel: _hotelModel.priceLevel,
    hotelClass: _hotelModel.hotelClass,
    numReviews: _hotelModel.numReviews,
    phone: _hotelModel.phone,
    website: _hotelModel.website,
    photo: Uint8List(0),
    photoUrl: _hotelModel.photoUrl,
    description: _hotelModel.description,
    address: _hotelModel.address,
    email: _hotelModel.email,
    distance: _hotelModel.distance,
  );

  @override
  void execute() {
    _favoritesDB.favoriteHotelsDao.add(_favoriteHotel);
  }

}