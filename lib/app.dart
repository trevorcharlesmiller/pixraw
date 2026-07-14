import 'package:flutter/material.dart';
import 'package:pixraw/libraw_error.dart';
import 'package:pixraw/main_window.dart';

class PixRawApp extends StatelessWidget {
  final String? libRawLoadError;
  const PixRawApp({super.key, required this.libRawLoadError});

  @override
  Widget build(BuildContext context) {
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
      themeMode: ThemeMode.system,
      home: libRawLoadError==null ? MainWindow() : LibRawError(errorMessage: libRawLoadError!,),
    );
  }
}
