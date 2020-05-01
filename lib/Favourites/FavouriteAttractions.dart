import 'package:moor/moor.dart';

class FavouriteAttractions extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get attractionId => integer()();
}

