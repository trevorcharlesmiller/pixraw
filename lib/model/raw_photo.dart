import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixraw/model/raw_photo_info.dart';

part 'raw_photo.freezed.dart';

@freezed
abstract class RawPhoto with _$RawPhoto {

  const RawPhoto._();

  const factory RawPhoto({
    required String filePath,
    @Default(false) bool selected,
    @Default(false) bool loaded,

    @Default(RawPhotoInfo()) RawPhotoInfo info,
  }) = _RawPhoto;
}