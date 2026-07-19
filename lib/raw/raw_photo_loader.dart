import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_libraw/flutter_libraw.dart';

class RawPhotoResult {
  final Uint8List? bytes;
  final bool hasError;

  RawPhotoResult({required this.bytes, required this.hasError});
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