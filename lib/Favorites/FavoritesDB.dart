/// Generate files once
/// flutter packages pub run build_runner build
///
/// Watch for changes in files
/// flutter packages pub run build_runner watch
import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:touristadvisor/Favorites/Attractions/FavoriteAttractionsDao.dart';

import 'Attractions/FavoriteAttractions.dart';

part 'FavoritesDB.g.dart';

@UseMoor(tables: [FavoriteAttractions], daos: [FavoriteAttractionsDao])
class FavoritesDB extends _$FavoritesDB {
  FavoritesDB() : super(_openConnection());
  FavoritesDB.withQueryExecutor(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;


}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}