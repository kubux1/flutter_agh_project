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

import 'FavouriteAttractions.dart';

part 'FavouritesDB.g.dart';

@UseMoor(tables: [FavouriteAttractions])
class FavouritesDB extends _$FavouritesDB {
  FavouritesDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<FavouriteAttraction>> get watchFavouriteAttractions =>
      select(favouriteAttractions).watch();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}