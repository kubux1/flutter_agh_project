import 'package:moor/moor.dart';

class FavoriteHotels extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get location_id => integer()();
  TextColumn get name => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  IntColumn get numReviews => integer()();
  RealColumn get rating => real()();
  TextColumn get priceLevel => text()();
  TextColumn get price => text()();
  RealColumn get hotelClass => real()();
  TextColumn get phone => text()();
  TextColumn get website => text()();
  BlobColumn get photo => blob()();
  TextColumn get photoUrl => text()();
  TextColumn get description => text()();
  TextColumn get address => text()();
  TextColumn get email => text()();
  RealColumn get distance => real()();
}
