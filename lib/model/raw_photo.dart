import 'package:freezed_annotation/freezed_annotation.dart';
import '../raw/raw_photo_loader.dart';

part 'raw_photo.freezed.dart';

@freezed
abstract class RawPhoto with _$RawPhoto {

  const RawPhoto._();

  const factory RawPhoto({
    required String filePath,
    @Default(false) bool selected,
  }) = _RawPhoto;

  Future<RawPhotoResult> loadThumbnail() {
    return RawPhotoLoader().loadRawPhotoThumbnail(filePath);
  }
}