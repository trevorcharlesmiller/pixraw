import 'package:meta/meta.dart';

import '../raw/raw_photo_loader.dart';

@immutable
class RawPhoto {
  final String filePath;
  final bool selected;

  RawPhoto({required this.filePath, this.selected = false});

  Future<RawPhotoResult> loadThumbnail() {
    return RawPhotoLoader().loadRawPhotoThumbnail(filePath);
  }

  RawPhoto copyWith({
    String? filePath,
    bool? selected,
    RawPhotoLoader? loader,
  }) {
    return RawPhoto(
      filePath: filePath ?? this.filePath,
      selected: selected ?? this.selected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RawPhoto &&
        other.filePath == filePath &&
        other.selected ==
            selected; // Now this is safe because fields are final!
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, selected);
}
