import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_photo_info.freezed.dart';

@freezed
abstract class RawPhotoInfo with _$RawPhotoInfo {
  const factory RawPhotoInfo({
    @Default(0) int flip,
  }) = _RawPhotoInfo;
}