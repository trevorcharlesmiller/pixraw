import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/state/providers.dart';

import '../model/app_config.dart';


class AppConfigNotifier extends Notifier<AppConfig> {
  static const _themeKey = 'theme_mode';
  static const _fullScreenKey = 'is_full_screen';
  static const _infoPanelKey = 'is_panel_open';

  @override
  AppConfig build() {
    final prefs = ref.watch(sharedPreferencesProvider);

    final savedThemeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    final savedIsFullScreen = prefs.getBool(_fullScreenKey) ?? false;
    final isPanelOpen = prefs.getBool(_infoPanelKey) ?? false;

    return AppConfig(
      themeMode: ThemeMode.values[savedThemeIndex],
      isFullScreen: savedIsFullScreen,
      isPanelOpen: isPanelOpen
    );
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    ref.read(sharedPreferencesProvider).setInt(_themeKey, mode.index);
  }

  void toggleFullScreen(bool value) {
    state = state.copyWith(isFullScreen: value);
    ref.read(sharedPreferencesProvider).setBool(_fullScreenKey, value);
  }

  void togglePanelOpen(bool value) {
    state = state.copyWith(isPanelOpen: value);
    ref.read(sharedPreferencesProvider).setBool(_infoPanelKey, value);
  }
}

// 4. Expose the config
final appConfigProvider = NotifierProvider<AppConfigNotifier, AppConfig>(AppConfigNotifier.new);