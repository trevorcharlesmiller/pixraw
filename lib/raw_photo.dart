import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:meta/meta.dart';
import 'package:flutter_libraw/flutter_libraw.dart';

@immutable
class RawPhoto {
  final String filePath;
  final bool selected; // Now final!
  final RawPhotoLoader? loader;

  RawPhoto({required this.filePath, this.selected = false})
    : loader = RawPhotoLoader();

  Future<RawPhotoResult> loadThumbnail() {
    return loader!.loadRawPhotoThumbnail(filePath);
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

class RawPhotoResult {
  final Uint8List? bytes;
  final bool _hasError;

  RawPhotoResult({required this.bytes, required this._hasError});
}

class RawPhotoLoader {
  Future<RawPhotoResult> loadRawPhotoThumbnail(String filePath) async {
    try {
      Pointer<libraw_data_t> ptr = flutterLibRawBindings.libraw_init(0);
      File rawFile = File(filePath);
      int result = flutterLibRawBindings.libraw_open_file(
        ptr,
        rawFile.absolute.path.toNativeUtf8().cast(),
      );
      if (result != 0) {
        print('Failed to open raw file');
      }
      flutterLibRawBindings.libraw_unpack_thumb(ptr);
      final nativeBytes = pointerToUint8List(
        ptr.ref.thumbnail.thumb,
        ptr.ref.thumbnail.tlength,
      );
      final dartBytes = Uint8List.fromList(nativeBytes);
      flutterLibRawBindings.libraw_close(ptr);
      return RawPhotoResult(bytes: dartBytes, hasError: false);
    } catch (err) {
      print(err);
      return RawPhotoResult(bytes: null, hasError: true);
    }
  }
}
