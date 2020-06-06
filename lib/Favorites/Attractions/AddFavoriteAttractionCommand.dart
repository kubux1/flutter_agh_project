import 'package:moor/moor.dart';
import 'package:touristadvisor/Favorites/Command.dart';
import 'package:touristadvisor/Model/AttractionModel.dart';

import '../Command.dart';
import '../FavoritesDB.dart';

class AddFavoriteAttractionCommand implements Command {
  final FavoritesDB _favoritesDB;
  final AttractionModel _attractionModel;

  AddFavoriteAttractionCommand(this._favoritesDB, this._attractionModel);

  FavoriteAttraction get _favoriteAttraction => FavoriteAttraction(
        attractionId: _attractionModel.id,
        description: _attractionModel.description,
        phoneNumber: _attractionModel.phoneNumber,
        name: _attractionModel.name,
        address: _attractionModel.address,
        email: _attractionModel.email,
        photo: Uint8List(0),
        latitude: _attractionModel.latitude,
        longitude: _attractionModel.longitude,
        numReviews: _attractionModel.numReviews,
      );

  @override
  void execute() {
    _favoritesDB.favoriteAttractionsDao.add(_favoriteAttraction);
  }
}
