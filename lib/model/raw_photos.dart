import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixraw/model/rating_filter.dart';
import 'package:pixraw/model/raw_photo.dart';

part 'raw_photos.freezed.dart';

@freezed
abstract class RawPhotos with _$RawPhotos {
  const RawPhotos._();

  const factory RawPhotos({
    @Default(null) Directory? directory,
    @Default([]) List<RawPhoto> rawPhotos,
    @Default(0) int currentPhoto,
    @Default(RatingFilter()) RatingFilter ratingFilter,
  }) = _RawPhotos;

  List<RawPhoto> get rawPhotoPaths {
    return rawPhotos.where((photo) {
      return ratingFilter.isMatch(photo); 
    }).toList();
  }
}