// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FavoritesDB.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FavoriteAttraction extends DataClass
    implements Insertable<FavoriteAttraction> {
  final int id;
  final int attractionId;
  final String name;
  final double latitude;
  final double longitude;
  final int numReviews;
  final Uint8List photo;
  final String description;
  final String address;
  final String phoneNumber;
  final String email;
  FavoriteAttraction(
      {@required this.id,
      @required this.attractionId,
      @required this.name,
      @required this.latitude,
      @required this.longitude,
      @required this.numReviews,
      @required this.photo,
      @required this.description,
      @required this.address,
      @required this.phoneNumber,
      @required this.email});
  factory FavoriteAttraction.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    return FavoriteAttraction(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      attractionId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}attraction_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      numReviews: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}num_reviews']),
      photo: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}photo']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phoneNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  factory FavoriteAttraction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteAttraction(
      id: serializer.fromJson<int>(json['id']),
      attractionId: serializer.fromJson<int>(json['attractionId']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      numReviews: serializer.fromJson<int>(json['numReviews']),
      photo: serializer.fromJson<Uint8List>(json['photo']),
      description: serializer.fromJson<String>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'attractionId': serializer.toJson<int>(attractionId),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'numReviews': serializer.toJson<int>(numReviews),
      'photo': serializer.toJson<Uint8List>(photo),
      'description': serializer.toJson<String>(description),
      'address': serializer.toJson<String>(address),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'email': serializer.toJson<String>(email),
    };
  }

  @override
  FavoriteAttractionsCompanion createCompanion(bool nullToAbsent) {
    return FavoriteAttractionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      attractionId: attractionId == null && nullToAbsent
          ? const Value.absent()
          : Value(attractionId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      numReviews: numReviews == null && nullToAbsent
          ? const Value.absent()
          : Value(numReviews),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  FavoriteAttraction copyWith(
          {int id,
          int attractionId,
          String name,
          double latitude,
          double longitude,
          int numReviews,
          Uint8List photo,
          String description,
          String address,
          String phoneNumber,
          String email}) =>
      FavoriteAttraction(
        id: id ?? this.id,
        attractionId: attractionId ?? this.attractionId,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        numReviews: numReviews ?? this.numReviews,
        photo: photo ?? this.photo,
        description: description ?? this.description,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteAttraction(')
          ..write('id: $id, ')
          ..write('attractionId: $attractionId, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('numReviews: $numReviews, ')
          ..write('photo: $photo, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          attractionId.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  latitude.hashCode,
                  $mrjc(
                      longitude.hashCode,
                      $mrjc(
                          numReviews.hashCode,
                          $mrjc(
                              photo.hashCode,
                              $mrjc(
                                  description.hashCode,
                                  $mrjc(
                                      address.hashCode,
                                      $mrjc(phoneNumber.hashCode,
                                          email.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavoriteAttraction &&
          other.id == this.id &&
          other.attractionId == this.attractionId &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.numReviews == this.numReviews &&
          other.photo == this.photo &&
          other.description == this.description &&
          other.address == this.address &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email);
}

class FavoriteAttractionsCompanion extends UpdateCompanion<FavoriteAttraction> {
  final Value<int> id;
  final Value<int> attractionId;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> numReviews;
  final Value<Uint8List> photo;
  final Value<String> description;
  final Value<String> address;
  final Value<String> phoneNumber;
  final Value<String> email;
  const FavoriteAttractionsCompanion({
    this.id = const Value.absent(),
    this.attractionId = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.numReviews = const Value.absent(),
    this.photo = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
  });
  FavoriteAttractionsCompanion.insert({
    this.id = const Value.absent(),
    @required int attractionId,
    @required String name,
    @required double latitude,
    @required double longitude,
    @required int numReviews,
    @required Uint8List photo,
    @required String description,
    @required String address,
    @required String phoneNumber,
    @required String email,
  })  : attractionId = Value(attractionId),
        name = Value(name),
        latitude = Value(latitude),
        longitude = Value(longitude),
        numReviews = Value(numReviews),
        photo = Value(photo),
        description = Value(description),
        address = Value(address),
        phoneNumber = Value(phoneNumber),
        email = Value(email);
  FavoriteAttractionsCompanion copyWith(
      {Value<int> id,
      Value<int> attractionId,
      Value<String> name,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> numReviews,
      Value<Uint8List> photo,
      Value<String> description,
      Value<String> address,
      Value<String> phoneNumber,
      Value<String> email}) {
    return FavoriteAttractionsCompanion(
      id: id ?? this.id,
      attractionId: attractionId ?? this.attractionId,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      numReviews: numReviews ?? this.numReviews,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }
}

class $FavoriteAttractionsTable extends FavoriteAttractions
    with TableInfo<$FavoriteAttractionsTable, FavoriteAttraction> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoriteAttractionsTable(this._db, [this._alias]);
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

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedRealColumn _latitude;
  @override
  GeneratedRealColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedRealColumn _constructLatitude() {
    return GeneratedRealColumn(
      'latitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedRealColumn _longitude;
  @override
  GeneratedRealColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedRealColumn _constructLongitude() {
    return GeneratedRealColumn(
      'longitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numReviewsMeta = const VerificationMeta('numReviews');
  GeneratedIntColumn _numReviews;
  @override
  GeneratedIntColumn get numReviews => _numReviews ??= _constructNumReviews();
  GeneratedIntColumn _constructNumReviews() {
    return GeneratedIntColumn(
      'num_reviews',
      $tableName,
      false,
    );
  }

  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  GeneratedBlobColumn _photo;
  @override
  GeneratedBlobColumn get photo => _photo ??= _constructPhoto();
  GeneratedBlobColumn _constructPhoto() {
    return GeneratedBlobColumn(
      'photo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  GeneratedTextColumn _phoneNumber;
  @override
  GeneratedTextColumn get phoneNumber =>
      _phoneNumber ??= _constructPhoneNumber();
  GeneratedTextColumn _constructPhoneNumber() {
    return GeneratedTextColumn(
      'phone_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        attractionId,
        name,
        latitude,
        longitude,
        numReviews,
        photo,
        description,
        address,
        phoneNumber,
        email
      ];
  @override
  $FavoriteAttractionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorite_attractions';
  @override
  final String actualTableName = 'favorite_attractions';
  @override
  VerificationContext validateIntegrity(FavoriteAttractionsCompanion d,
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
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.latitude.present) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableValue(d.latitude.value, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (d.longitude.present) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableValue(d.longitude.value, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (d.numReviews.present) {
      context.handle(_numReviewsMeta,
          numReviews.isAcceptableValue(d.numReviews.value, _numReviewsMeta));
    } else if (isInserting) {
      context.missing(_numReviewsMeta);
    }
    if (d.photo.present) {
      context.handle(
          _photoMeta, photo.isAcceptableValue(d.photo.value, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.address.present) {
      context.handle(_addressMeta,
          address.isAcceptableValue(d.address.value, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (d.phoneNumber.present) {
      context.handle(_phoneNumberMeta,
          phoneNumber.isAcceptableValue(d.phoneNumber.value, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteAttraction map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavoriteAttraction.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavoriteAttractionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.attractionId.present) {
      map['attraction_id'] = Variable<int, IntType>(d.attractionId.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.latitude.present) {
      map['latitude'] = Variable<double, RealType>(d.latitude.value);
    }
    if (d.longitude.present) {
      map['longitude'] = Variable<double, RealType>(d.longitude.value);
    }
    if (d.numReviews.present) {
      map['num_reviews'] = Variable<int, IntType>(d.numReviews.value);
    }
    if (d.photo.present) {
      map['photo'] = Variable<Uint8List, BlobType>(d.photo.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.address.present) {
      map['address'] = Variable<String, StringType>(d.address.value);
    }
    if (d.phoneNumber.present) {
      map['phone_number'] = Variable<String, StringType>(d.phoneNumber.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    return map;
  }

  @override
  $FavoriteAttractionsTable createAlias(String alias) {
    return $FavoriteAttractionsTable(_db, alias);
  }
}

abstract class _$FavoritesDB extends GeneratedDatabase {
  _$FavoritesDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FavoriteAttractionsTable _favoriteAttractions;
  $FavoriteAttractionsTable get favoriteAttractions =>
      _favoriteAttractions ??= $FavoriteAttractionsTable(this);
  FavoriteAttractionsDao _favoriteAttractionsDao;
  FavoriteAttractionsDao get favoriteAttractionsDao =>
      _favoriteAttractionsDao ??= FavoriteAttractionsDao(this as FavoritesDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteAttractions];
}
