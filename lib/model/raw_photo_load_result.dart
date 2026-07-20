import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixraw/model/raw_photo_info.dart';

part 'raw_photo_load_result.freezed.dart';

@freezed
abstract class RawPhotoResult with _$RawPhotoResult {
  const factory RawPhotoResult({
    @Default(null) Uint8List? bytes,
    @Default(false) bool hasError,

    @Default(null) RawPhotoInfo? info,
    @Default(0) int quarterTurns,
  }) = _RawPhotoResult;
}