/// Generate files once
/// flutter packages pub run build_runner build
///
/// Watch for changes in files
/// flutter packages pub run build_runner watch
import 'package:moor/moor.dart';

import '../FavoritesDB.dart';
import 'FavoriteHotels.dart';

part 'FavoriteHotelsDao.g.dart';

@UseDao(tables: [FavoriteHotels])
class FavoriteHotelsDao extends DatabaseAccessor<FavoritesDB> with _$FavoriteHotelsDaoMixin {
  FavoriteHotelsDao(FavoritesDB db) : super(db);

  Stream<List<FavoriteHotel>> get watchAll =>
      select(favoriteHotels).watch();

  Future<bool> getByByLocationId(int id) =>
      (select(favoriteHotels)
      ..where((e) => e.location_id.equals(id)))
      .getSingle().then((value) => value != null);

  Future<int> add(FavoriteHotel hotel) =>
      into(favoriteHotels).insert(hotel);

  Future deleteByLocationId(int locationId) =>
      (delete(favoriteHotels)
        ..where((e) => e.location_id.equals(locationId)))
          .go();
}