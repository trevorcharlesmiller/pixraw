import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_photo_info.freezed.dart';

@freezed
abstract class RawPhotoInfo with _$RawPhotoInfo {
  const factory RawPhotoInfo({
    @Default(null) String? cameraMake,
    @Default(null) String? cameraModel,
    @Default(null) String? lens,
    @Default(null) double? aperture,
    @Default(null) double? shutter,
    @Default(null) int? iso,
    @Default(null) int? focalLength,
    @Default(null) int? width,
    @Default(null) int? height,
    @Default(null) DateTime? timestamp,
    @Default(0) int flip,
  }) = _RawPhotoInfo;
}