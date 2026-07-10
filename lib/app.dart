import 'package:flutter/material.dart';
import 'package:pixraw/main_window.dart';

class PixRawApp extends StatelessWidget {
  const PixRawApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PixRAW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Change this to your preferred color
          brightness: Brightness.light, // Or Brightness.dark for dark mode
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainWindow(),
    );
  }
}
