import 'package:moor/moor.dart';

class FavoriteAttractions extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get attractionId => integer()();
  TextColumn get name => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  IntColumn get numReviews => integer()();
  BlobColumn get photo => blob()();
  TextColumn get description => text()();
  TextColumn get address => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get email => text()();
}

