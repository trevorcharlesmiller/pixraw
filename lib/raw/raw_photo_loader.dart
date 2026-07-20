import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_libraw/flutter_libraw.dart';

import '../model/raw_photo.dart';
import '../model/raw_photo_info.dart';
import '../model/raw_photo_load_result.dart';

class RawPhotoLoader {

  int convertFlipToQuarterTurns(int rawFlip) {
    int quarterTurns = 0;
    switch (rawFlip) {
      case 3 : {
        quarterTurns = 2; // 2 quarter turns = 180 degrees
        break;
      }
      case 5 : {
        quarterTurns = 3; // 3 quarter turns = 270 degrees = 90 counter clockwise
        break;
      }
      case 6 : {
        quarterTurns = 1; // 1 quarter turn = 90 degrees clockwise
      }
    }
    return quarterTurns;
  }

  RawPhotoInfo loadPhotoInfo(Pointer<libraw_data_t> ptr) {
    int rawFlip = ptr.ref.sizes.flip;
    int flip = convertFlipToQuarterTurns(rawFlip);
    return RawPhotoInfo(flip: flip);
  }

  Future<RawPhotoResult> loadRawPhotoThumbnail(RawPhoto rawPhoto) async {
    try {
      Pointer<libraw_data_t> ptr = flutterLibRawBindings.libraw_init(0);
      File rawFile = File(rawPhoto.filePath);
      int result = flutterLibRawBindings.libraw_open_file(
        ptr,
        rawFile.absolute.path.toNativeUtf8().cast(),
      );
      if (result != 0) {
        print('Failed to open raw file');
      }

      RawPhotoInfo? info;
      if(!rawPhoto.loaded) {
        info = loadPhotoInfo(ptr);
      }

      int quarterTurns = convertFlipToQuarterTurns(ptr.ref.sizes.flip);

      flutterLibRawBindings.libraw_unpack_thumb(ptr);
      final nativeBytes = pointerToUint8List(
        ptr.ref.thumbnail.thumb,
        ptr.ref.thumbnail.tlength,
      );
      final dartBytes = Uint8List.fromList(nativeBytes);
      flutterLibRawBindings.libraw_close(ptr);

      return RawPhotoResult(bytes: dartBytes, hasError: false, info: info, quarterTurns: quarterTurns);
    } catch (err) {
      print(err);
      return RawPhotoResult(bytes: null, hasError: true, info: null);
    }
  }
}