import 'package:flutter/material.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Cap the global image cache at 50MB (adjust as needed)
  // This forces Flutter to instantly drop old full-screen images out of RAM
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;
  bool loaded = await loadLibRaw();
  await windowManager.ensureInitialized();
  runApp(const PixRawApp());
}