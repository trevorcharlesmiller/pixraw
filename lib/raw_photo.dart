import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_libraw/flutter_libraw.dart';

class RawPhoto {
  final String filePath;
  bool selected;
  RawPhotoLoader? loader;

  RawPhoto({required this.filePath}): selected = false;

  Future<RawPhotoResult> loadThumbnail() {
    loader = RawPhotoLoader();
    return loader!.loadRawPhotoThumbnail(1024.0 , filePath);
  }

  void close() {
    if(loader != null) {
      loader!.closePointer();
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RawPhoto && other.filePath == filePath;
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);
}

class RawPhotoResult {
  final Uint8List? bytes;
  final bool _hasError;

  RawPhotoResult({required this.bytes, required this._hasError});
}

class RawPhotoLoader {
  late Pointer<libraw_data_t> ptr;

  RawPhotoLoader() : ptr = flutterLibRawBindings.libraw_init(0);

  Future<RawPhotoResult> loadRawPhotoThumbnail(double maxSize, String filePath) {
    //print('Start load: $filePath - ${DateTime.now().toIso8601String()}');
    try {
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
      return Future.value(RawPhotoResult(bytes: Uint8List.fromList(nativeBytes), hasError: false));
    } catch (err) {
      print(err);
      return Future.value(RawPhotoResult(bytes: null, hasError: true));
    }
  }

  void closePointer() {
    try {
      flutterLibRawBindings.libraw_close(ptr);
    } catch (e) {
      print("Error during native cleanup: $e");
    }
  }
}