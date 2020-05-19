
import 'dart:ffi';
import 'dart:math';
import 'dart:convert' show json, jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';

class MediumPhotoModel {
  final int width;
  final int height;
  final String url;

  MediumPhotoModel({this.width, this.url, this.height});

  factory MediumPhotoModel.fromJson(Map<String, dynamic> json) {

    return MediumPhotoModel (
        width: int.parse(json["width"] ?? '0'),
        height: int.parse(json["height"] ?? '0'),
        url: json["url"]
    );
  }
}

class ImagesModel {
  final MediumPhotoModel photo;

  ImagesModel({this.photo});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {

    return ImagesModel (
        photo: MediumPhotoModel.fromJson(json["medium"]) == null ? null : MediumPhotoModel.fromJson(json["medium"])
    );
  }
}

class PhotoModel {
//  final String url;
  final ImagesModel images;

  PhotoModel({this.images});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {

    return PhotoModel (
      images: ImagesModel.fromJson(json["images"]) == null ? null : ImagesModel.fromJson(json["images"])
    );
  }
}
