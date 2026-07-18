import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/state/app_config_notifier.dart';
import 'package:pixraw/ui/widgets/libraw_error.dart';
import 'package:pixraw/main_window.dart';

class PixRawApp extends ConsumerWidget {
  final String? libRawLoadError;
  const PixRawApp({super.key, required this.libRawLoadError});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(appConfigProvider);

    return MaterialApp(
      title: 'PixRAW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Change this to your preferred color
          brightness: Brightness.light, // Or Brightness.dark for dark mode
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: config.themeMode,
      home: libRawLoadError==null ? MainWindow() : LibRawError(errorMessage: libRawLoadError!,),
    );
  }
}
