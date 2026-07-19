import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixraw/model/raw_photo.dart';

part 'raw_photos.freezed.dart';

@freezed
abstract class RawPhotos with _$RawPhotos {
  const factory RawPhotos({
    @Default(null) Directory? directory,
    @Default([]) List<RawPhoto> rawPhotoPaths,
    @Default(0) int currentPhoto,
  }) = _RawPhotos;
}