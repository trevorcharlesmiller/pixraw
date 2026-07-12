import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';

Future<String?> loadLibRawLibrary() async {
  try {
    String path = determineLibraryName();
    flutterLibRawBindings =
        FlutterLibRawBindings(DynamicLibrary.open(path));
    return null;
  } catch (err) {
    return err.toString();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;
  String? error = await loadLibRawLibrary();
  await windowManager.ensureInitialized();
  runApp(PixRawApp(libRawLoadError: error,));
}