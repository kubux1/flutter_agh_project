import 'package:moor/moor.dart';
import 'package:touristadvisor/Favorites/FavoritesDB.dart';
import 'package:touristadvisor/Model/AttractionModel.dart';

import 'FavoriteAttractions.dart';

part 'FavoriteAttractionsDao.g.dart';

@UseDao(tables: [FavoriteAttractions])
class FavoriteAttractionsDao extends DatabaseAccessor<FavoritesDB> with _$FavoriteAttractionsDaoMixin{
  FavoriteAttractionsDao(FavoritesDB db) : super(db);

  Stream<List<FavoriteAttraction>> get watchAll =>
      select(favoriteAttractions).watch();

  Future<FavoriteAttraction> getById(int id) => (select(favoriteAttractions)
      ..where((e) => e.id.equals(id)))
      .getSingle();

  Future<FavoriteAttraction> getByAttractionId(int id) => (select(favoriteAttractions)
    ..where((e) => e.attractionId.equals(id)))
      .getSingle();

  Future<int> add(FavoriteAttraction attraction) =>
      into(favoriteAttractions).insert(attraction);

  Future deleteByAttractionId(int favoriteAttractionId) =>
      (delete(favoriteAttractions)
        ..where((e) => e.attractionId.equals(favoriteAttractionId)))
          .go();

  Future deleteAll() => (delete(favoriteAttractions)).go();
}