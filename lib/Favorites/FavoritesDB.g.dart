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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || attractionId != null) {
      map['attraction_id'] = Variable<int>(attractionId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || numReviews != null) {
      map['num_reviews'] = Variable<int>(numReviews);
    }
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<Uint8List>(photo);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
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
  static Insertable<FavoriteAttraction> custom({
    Expression<int> id,
    Expression<int> attractionId,
    Expression<String> name,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<int> numReviews,
    Expression<Uint8List> photo,
    Expression<String> description,
    Expression<String> address,
    Expression<String> phoneNumber,
    Expression<String> email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attractionId != null) 'attraction_id': attractionId,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (numReviews != null) 'num_reviews': numReviews,
      if (photo != null) 'photo': photo,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (attractionId.present) {
      map['attraction_id'] = Variable<int>(attractionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (numReviews.present) {
      map['num_reviews'] = Variable<int>(numReviews.value);
    }
    if (photo.present) {
      map['photo'] = Variable<Uint8List>(photo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
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
  VerificationContext validateIntegrity(Insertable<FavoriteAttraction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('attraction_id')) {
      context.handle(
          _attractionIdMeta,
          attractionId.isAcceptableOrUnknown(
              data['attraction_id'], _attractionIdMeta));
    } else if (isInserting) {
      context.missing(_attractionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('num_reviews')) {
      context.handle(
          _numReviewsMeta,
          numReviews.isAcceptableOrUnknown(
              data['num_reviews'], _numReviewsMeta));
    } else if (isInserting) {
      context.missing(_numReviewsMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo'], _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number'], _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
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
  $FavoriteAttractionsTable createAlias(String alias) {
    return $FavoriteAttractionsTable(_db, alias);
  }
}

class FavoriteHotel extends DataClass implements Insertable<FavoriteHotel> {
  final int id;
  final int location_id;
  final String name;
  final double latitude;
  final double longitude;
  final int numReviews;
  final double rating;
  final String priceLevel;
  final String price;
  final double hotelClass;
  final String phone;
  final String website;
  final Uint8List photo;
  final String photoUrl;
  final String description;
  final String address;
  final String email;
  final double distance;
  FavoriteHotel(
      {@required this.id,
      @required this.location_id,
      @required this.name,
      @required this.latitude,
      @required this.longitude,
      @required this.numReviews,
      @required this.rating,
      @required this.priceLevel,
      @required this.price,
      @required this.hotelClass,
      @required this.phone,
      @required this.website,
      @required this.photo,
      @required this.photoUrl,
      @required this.description,
      @required this.address,
      @required this.email,
      @required this.distance});
  factory FavoriteHotel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    return FavoriteHotel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      location_id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      numReviews: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}num_reviews']),
      rating:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      priceLevel: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}price_level']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      hotelClass: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}hotel_class']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      website:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}website']),
      photo: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}photo']),
      photoUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}photo_url']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      distance: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}distance']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || location_id != null) {
      map['location_id'] = Variable<int>(location_id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || numReviews != null) {
      map['num_reviews'] = Variable<int>(numReviews);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || priceLevel != null) {
      map['price_level'] = Variable<String>(priceLevel);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || hotelClass != null) {
      map['hotel_class'] = Variable<double>(hotelClass);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<Uint8List>(photo);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    return map;
  }

  factory FavoriteHotel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteHotel(
      id: serializer.fromJson<int>(json['id']),
      location_id: serializer.fromJson<int>(json['location_id']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      numReviews: serializer.fromJson<int>(json['numReviews']),
      rating: serializer.fromJson<double>(json['rating']),
      priceLevel: serializer.fromJson<String>(json['priceLevel']),
      price: serializer.fromJson<String>(json['price']),
      hotelClass: serializer.fromJson<double>(json['hotelClass']),
      phone: serializer.fromJson<String>(json['phone']),
      website: serializer.fromJson<String>(json['website']),
      photo: serializer.fromJson<Uint8List>(json['photo']),
      photoUrl: serializer.fromJson<String>(json['photoUrl']),
      description: serializer.fromJson<String>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      email: serializer.fromJson<String>(json['email']),
      distance: serializer.fromJson<double>(json['distance']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location_id': serializer.toJson<int>(location_id),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'numReviews': serializer.toJson<int>(numReviews),
      'rating': serializer.toJson<double>(rating),
      'priceLevel': serializer.toJson<String>(priceLevel),
      'price': serializer.toJson<String>(price),
      'hotelClass': serializer.toJson<double>(hotelClass),
      'phone': serializer.toJson<String>(phone),
      'website': serializer.toJson<String>(website),
      'photo': serializer.toJson<Uint8List>(photo),
      'photoUrl': serializer.toJson<String>(photoUrl),
      'description': serializer.toJson<String>(description),
      'address': serializer.toJson<String>(address),
      'email': serializer.toJson<String>(email),
      'distance': serializer.toJson<double>(distance),
    };
  }

  FavoriteHotel copyWith(
          {int id,
          int location_id,
          String name,
          double latitude,
          double longitude,
          int numReviews,
          double rating,
          String priceLevel,
          String price,
          double hotelClass,
          String phone,
          String website,
          Uint8List photo,
          String photoUrl,
          String description,
          String address,
          String email,
          double distance}) =>
      FavoriteHotel(
        id: id ?? this.id,
        location_id: location_id ?? this.location_id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        numReviews: numReviews ?? this.numReviews,
        rating: rating ?? this.rating,
        priceLevel: priceLevel ?? this.priceLevel,
        price: price ?? this.price,
        hotelClass: hotelClass ?? this.hotelClass,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        photo: photo ?? this.photo,
        photoUrl: photoUrl ?? this.photoUrl,
        description: description ?? this.description,
        address: address ?? this.address,
        email: email ?? this.email,
        distance: distance ?? this.distance,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteHotel(')
          ..write('id: $id, ')
          ..write('location_id: $location_id, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('numReviews: $numReviews, ')
          ..write('rating: $rating, ')
          ..write('priceLevel: $priceLevel, ')
          ..write('price: $price, ')
          ..write('hotelClass: $hotelClass, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('photo: $photo, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('distance: $distance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          location_id.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  latitude.hashCode,
                  $mrjc(
                      longitude.hashCode,
                      $mrjc(
                          numReviews.hashCode,
                          $mrjc(
                              rating.hashCode,
                              $mrjc(
                                  priceLevel.hashCode,
                                  $mrjc(
                                      price.hashCode,
                                      $mrjc(
                                          hotelClass.hashCode,
                                          $mrjc(
                                              phone.hashCode,
                                              $mrjc(
                                                  website.hashCode,
                                                  $mrjc(
                                                      photo.hashCode,
                                                      $mrjc(
                                                          photoUrl.hashCode,
                                                          $mrjc(
                                                              description
                                                                  .hashCode,
                                                              $mrjc(
                                                                  address
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      email
                                                                          .hashCode,
                                                                      distance
                                                                          .hashCode))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavoriteHotel &&
          other.id == this.id &&
          other.location_id == this.location_id &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.numReviews == this.numReviews &&
          other.rating == this.rating &&
          other.priceLevel == this.priceLevel &&
          other.price == this.price &&
          other.hotelClass == this.hotelClass &&
          other.phone == this.phone &&
          other.website == this.website &&
          other.photo == this.photo &&
          other.photoUrl == this.photoUrl &&
          other.description == this.description &&
          other.address == this.address &&
          other.email == this.email &&
          other.distance == this.distance);
}

class FavoriteHotelsCompanion extends UpdateCompanion<FavoriteHotel> {
  final Value<int> id;
  final Value<int> location_id;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> numReviews;
  final Value<double> rating;
  final Value<String> priceLevel;
  final Value<String> price;
  final Value<double> hotelClass;
  final Value<String> phone;
  final Value<String> website;
  final Value<Uint8List> photo;
  final Value<String> photoUrl;
  final Value<String> description;
  final Value<String> address;
  final Value<String> email;
  final Value<double> distance;
  const FavoriteHotelsCompanion({
    this.id = const Value.absent(),
    this.location_id = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.numReviews = const Value.absent(),
    this.rating = const Value.absent(),
    this.priceLevel = const Value.absent(),
    this.price = const Value.absent(),
    this.hotelClass = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.photo = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.distance = const Value.absent(),
  });
  FavoriteHotelsCompanion.insert({
    this.id = const Value.absent(),
    @required int location_id,
    @required String name,
    @required double latitude,
    @required double longitude,
    @required int numReviews,
    @required double rating,
    @required String priceLevel,
    @required String price,
    @required double hotelClass,
    @required String phone,
    @required String website,
    @required Uint8List photo,
    @required String photoUrl,
    @required String description,
    @required String address,
    @required String email,
    @required double distance,
  })  : location_id = Value(location_id),
        name = Value(name),
        latitude = Value(latitude),
        longitude = Value(longitude),
        numReviews = Value(numReviews),
        rating = Value(rating),
        priceLevel = Value(priceLevel),
        price = Value(price),
        hotelClass = Value(hotelClass),
        phone = Value(phone),
        website = Value(website),
        photo = Value(photo),
        photoUrl = Value(photoUrl),
        description = Value(description),
        address = Value(address),
        email = Value(email),
        distance = Value(distance);
  static Insertable<FavoriteHotel> custom({
    Expression<int> id,
    Expression<int> location_id,
    Expression<String> name,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<int> numReviews,
    Expression<double> rating,
    Expression<String> priceLevel,
    Expression<String> price,
    Expression<double> hotelClass,
    Expression<String> phone,
    Expression<String> website,
    Expression<Uint8List> photo,
    Expression<String> photoUrl,
    Expression<String> description,
    Expression<String> address,
    Expression<String> email,
    Expression<double> distance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location_id != null) 'location_id': location_id,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (numReviews != null) 'num_reviews': numReviews,
      if (rating != null) 'rating': rating,
      if (priceLevel != null) 'price_level': priceLevel,
      if (price != null) 'price': price,
      if (hotelClass != null) 'hotel_class': hotelClass,
      if (phone != null) 'phone': phone,
      if (website != null) 'website': website,
      if (photo != null) 'photo': photo,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (email != null) 'email': email,
      if (distance != null) 'distance': distance,
    });
  }

  FavoriteHotelsCompanion copyWith(
      {Value<int> id,
      Value<int> location_id,
      Value<String> name,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> numReviews,
      Value<double> rating,
      Value<String> priceLevel,
      Value<String> price,
      Value<double> hotelClass,
      Value<String> phone,
      Value<String> website,
      Value<Uint8List> photo,
      Value<String> photoUrl,
      Value<String> description,
      Value<String> address,
      Value<String> email,
      Value<double> distance}) {
    return FavoriteHotelsCompanion(
      id: id ?? this.id,
      location_id: location_id ?? this.location_id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      numReviews: numReviews ?? this.numReviews,
      rating: rating ?? this.rating,
      priceLevel: priceLevel ?? this.priceLevel,
      price: price ?? this.price,
      hotelClass: hotelClass ?? this.hotelClass,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      photo: photo ?? this.photo,
      photoUrl: photoUrl ?? this.photoUrl,
      description: description ?? this.description,
      address: address ?? this.address,
      email: email ?? this.email,
      distance: distance ?? this.distance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location_id.present) {
      map['location_id'] = Variable<int>(location_id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (numReviews.present) {
      map['num_reviews'] = Variable<int>(numReviews.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (priceLevel.present) {
      map['price_level'] = Variable<String>(priceLevel.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (hotelClass.present) {
      map['hotel_class'] = Variable<double>(hotelClass.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (photo.present) {
      map['photo'] = Variable<Uint8List>(photo.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    return map;
  }
}

class $FavoriteHotelsTable extends FavoriteHotels
    with TableInfo<$FavoriteHotelsTable, FavoriteHotel> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoriteHotelsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _location_idMeta =
      const VerificationMeta('location_id');
  GeneratedIntColumn _location_id;
  @override
  GeneratedIntColumn get location_id => _location_id ??= _constructLocationId();
  GeneratedIntColumn _constructLocationId() {
    return GeneratedIntColumn(
      'location_id',
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

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedRealColumn _rating;
  @override
  GeneratedRealColumn get rating => _rating ??= _constructRating();
  GeneratedRealColumn _constructRating() {
    return GeneratedRealColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceLevelMeta = const VerificationMeta('priceLevel');
  GeneratedTextColumn _priceLevel;
  @override
  GeneratedTextColumn get priceLevel => _priceLevel ??= _constructPriceLevel();
  GeneratedTextColumn _constructPriceLevel() {
    return GeneratedTextColumn(
      'price_level',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hotelClassMeta = const VerificationMeta('hotelClass');
  GeneratedRealColumn _hotelClass;
  @override
  GeneratedRealColumn get hotelClass => _hotelClass ??= _constructHotelClass();
  GeneratedRealColumn _constructHotelClass() {
    return GeneratedRealColumn(
      'hotel_class',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  GeneratedTextColumn _website;
  @override
  GeneratedTextColumn get website => _website ??= _constructWebsite();
  GeneratedTextColumn _constructWebsite() {
    return GeneratedTextColumn(
      'website',
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

  final VerificationMeta _photoUrlMeta = const VerificationMeta('photoUrl');
  GeneratedTextColumn _photoUrl;
  @override
  GeneratedTextColumn get photoUrl => _photoUrl ??= _constructPhotoUrl();
  GeneratedTextColumn _constructPhotoUrl() {
    return GeneratedTextColumn(
      'photo_url',
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

  final VerificationMeta _distanceMeta = const VerificationMeta('distance');
  GeneratedRealColumn _distance;
  @override
  GeneratedRealColumn get distance => _distance ??= _constructDistance();
  GeneratedRealColumn _constructDistance() {
    return GeneratedRealColumn(
      'distance',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        location_id,
        name,
        latitude,
        longitude,
        numReviews,
        rating,
        priceLevel,
        price,
        hotelClass,
        phone,
        website,
        photo,
        photoUrl,
        description,
        address,
        email,
        distance
      ];
  @override
  $FavoriteHotelsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorite_hotels';
  @override
  final String actualTableName = 'favorite_hotels';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteHotel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _location_idMeta,
          location_id.isAcceptableOrUnknown(
              data['location_id'], _location_idMeta));
    } else if (isInserting) {
      context.missing(_location_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('num_reviews')) {
      context.handle(
          _numReviewsMeta,
          numReviews.isAcceptableOrUnknown(
              data['num_reviews'], _numReviewsMeta));
    } else if (isInserting) {
      context.missing(_numReviewsMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('price_level')) {
      context.handle(
          _priceLevelMeta,
          priceLevel.isAcceptableOrUnknown(
              data['price_level'], _priceLevelMeta));
    } else if (isInserting) {
      context.missing(_priceLevelMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('hotel_class')) {
      context.handle(
          _hotelClassMeta,
          hotelClass.isAcceptableOrUnknown(
              data['hotel_class'], _hotelClassMeta));
    } else if (isInserting) {
      context.missing(_hotelClassMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website'], _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo'], _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(_photoUrlMeta,
          photoUrl.isAcceptableOrUnknown(data['photo_url'], _photoUrlMeta));
    } else if (isInserting) {
      context.missing(_photoUrlMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance'], _distanceMeta));
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteHotel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavoriteHotel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FavoriteHotelsTable createAlias(String alias) {
    return $FavoriteHotelsTable(_db, alias);
  }
}

abstract class _$FavoritesDB extends GeneratedDatabase {
  _$FavoritesDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FavoriteAttractionsTable _favoriteAttractions;
  $FavoriteAttractionsTable get favoriteAttractions =>
      _favoriteAttractions ??= $FavoriteAttractionsTable(this);
  $FavoriteHotelsTable _favoriteHotels;
  $FavoriteHotelsTable get favoriteHotels =>
      _favoriteHotels ??= $FavoriteHotelsTable(this);
  FavoriteAttractionsDao _favoriteAttractionsDao;
  FavoriteAttractionsDao get favoriteAttractionsDao =>
      _favoriteAttractionsDao ??= FavoriteAttractionsDao(this as FavoritesDB);
  FavoriteHotelsDao _favoriteHotelsDao;
  FavoriteHotelsDao get favoriteHotelsDao =>
      _favoriteHotelsDao ??= FavoriteHotelsDao(this as FavoritesDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [favoriteAttractions, favoriteHotels];
}
