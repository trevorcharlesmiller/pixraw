import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/state/app_config_notifier.dart';
import 'package:pixraw/state/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final sharedPreferences = await SharedPreferences.getInstance();

  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;
  String? error = await loadLibRawLibrary();

  await windowManager.ensureInitialized();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
  );

  final appConfig = container.read(appConfigProvider);
  WindowOptions windowOptions = WindowOptions(
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    if(appConfig.isFullScreen) {
      await windowManager.maximize();
    }
  });
  runApp(
      UncontrolledProviderScope(
        container: container,
        child: PixRawApp(libRawLoadError: error,),
      ),
  );
}