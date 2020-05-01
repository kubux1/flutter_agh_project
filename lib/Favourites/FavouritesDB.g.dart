// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FavouritesDB.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FavouriteAttraction extends DataClass
    implements Insertable<FavouriteAttraction> {
  final int id;
  final int attractionId;
  FavouriteAttraction({@required this.id, @required this.attractionId});
  factory FavouriteAttraction.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return FavouriteAttraction(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      attractionId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}attraction_id']),
    );
  }
  factory FavouriteAttraction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavouriteAttraction(
      id: serializer.fromJson<int>(json['id']),
      attractionId: serializer.fromJson<int>(json['attractionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'attractionId': serializer.toJson<int>(attractionId),
    };
  }

  @override
  FavouriteAttractionsCompanion createCompanion(bool nullToAbsent) {
    return FavouriteAttractionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      attractionId: attractionId == null && nullToAbsent
          ? const Value.absent()
          : Value(attractionId),
    );
  }

  FavouriteAttraction copyWith({int id, int attractionId}) =>
      FavouriteAttraction(
        id: id ?? this.id,
        attractionId: attractionId ?? this.attractionId,
      );
  @override
  String toString() {
    return (StringBuffer('FavouriteAttraction(')
          ..write('id: $id, ')
          ..write('attractionId: $attractionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, attractionId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavouriteAttraction &&
          other.id == this.id &&
          other.attractionId == this.attractionId);
}

class FavouriteAttractionsCompanion
    extends UpdateCompanion<FavouriteAttraction> {
  final Value<int> id;
  final Value<int> attractionId;
  const FavouriteAttractionsCompanion({
    this.id = const Value.absent(),
    this.attractionId = const Value.absent(),
  });
  FavouriteAttractionsCompanion.insert({
    this.id = const Value.absent(),
    @required int attractionId,
  }) : attractionId = Value(attractionId);
  FavouriteAttractionsCompanion copyWith(
      {Value<int> id, Value<int> attractionId}) {
    return FavouriteAttractionsCompanion(
      id: id ?? this.id,
      attractionId: attractionId ?? this.attractionId,
    );
  }
}

class $FavouriteAttractionsTable extends FavouriteAttractions
    with TableInfo<$FavouriteAttractionsTable, FavouriteAttraction> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavouriteAttractionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _attractionIdMeta =
      const VerificationMeta('attractionId');
  GeneratedIntColumn _attractionId;
  @override
  GeneratedIntColumn get attractionId =>
      _attractionId ??= _constructAttractionId();
  GeneratedIntColumn _constructAttractionId() {
    return GeneratedIntColumn(
      'attraction_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, attractionId];
  @override
  $FavouriteAttractionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favourite_attractions';
  @override
  final String actualTableName = 'favourite_attractions';
  @override
  VerificationContext validateIntegrity(FavouriteAttractionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.attractionId.present) {
      context.handle(
          _attractionIdMeta,
          attractionId.isAcceptableValue(
              d.attractionId.value, _attractionIdMeta));
    } else if (isInserting) {
      context.missing(_attractionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavouriteAttraction map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavouriteAttraction.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavouriteAttractionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.attractionId.present) {
      map['attraction_id'] = Variable<int, IntType>(d.attractionId.value);
    }
    return map;
  }

  @override
  $FavouriteAttractionsTable createAlias(String alias) {
    return $FavouriteAttractionsTable(_db, alias);
  }
}

abstract class _$FavouritesDB extends GeneratedDatabase {
  _$FavouritesDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FavouriteAttractionsTable _favouriteAttractions;
  $FavouriteAttractionsTable get favouriteAttractions =>
      _favouriteAttractions ??= $FavouriteAttractionsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favouriteAttractions];
}
