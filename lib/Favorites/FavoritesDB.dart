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
import 'package:touristadvisor/Favorites/Hotels/FavoriteHotels.dart';

import 'Attractions/FavoriteAttractions.dart';
import 'Hotels/FavoriteHotelsDao.dart';

part 'FavoritesDB.g.dart';

@UseMoor(tables: [FavoriteAttractions, FavoriteHotels], daos: [FavoriteAttractionsDao, FavoriteHotelsDao])
class FavoritesDB extends _$FavoritesDB {
  FavoritesDB() : super(_openConnection()) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  }
  FavoritesDB.withQueryExecutor(QueryExecutor e) : super(e) {
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
