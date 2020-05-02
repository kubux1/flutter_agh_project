import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:touristadvisor/Favorites/Attractions/AddFavoriteAttractionCommand.dart';
import 'package:touristadvisor/Favorites/FavoritesDB.dart';
import 'package:touristadvisor/Model/AttractionModel.dart';

void main() {
  FavoritesDB database;

  setUp(() {
    database = FavoritesDB.withQueryExecutor(VmDatabase.memory());
  });
  tearDown(() async {
    await database.close();
  });
  
  test('new attraction is added', () async {
    //arrange
    final id = 1;
    final model = AttractionModel (
        id: id,
        name: "",
        latitude: 0.0,
        longitude: 0.0,
        phoneNumber: "",
        numReviews: 0,
        description: "",
        address: "",
        email: ""
    );
    final command = AddFavoriteAttractionCommand(database, model);

    //act
    command.execute();
    final entity = await database.favoriteAttractionsDao.getById(id);

    //assert
    expect(entity.id, id);
  });
}