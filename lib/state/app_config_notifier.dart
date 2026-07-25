import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/state/providers.dart';

import '../model/app_config.dart';


class AppConfigNotifier extends Notifier<AppConfig> {
  static const _themeKey = 'theme_mode';
  static const _fullScreenKey = 'is_full_screen';
  static const _infoPanelKey = 'is_panel_open';
  static const _srcDirKey = 'source_directory';
  static const _targetDirKey = 'target_directory';
  static const _firstRunKey = 'is_first_run';

  @override
  AppConfig build() {
    final prefs = ref.watch(sharedPreferencesProvider);

    final savedThemeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    final savedIsFullScreen = prefs.getBool(_fullScreenKey) ?? false;
    final isPanelOpen = prefs.getBool(_infoPanelKey) ?? false;
    final srcDir = prefs.getString(_srcDirKey);
    final targetDir = prefs.getString(_targetDirKey);
    final isFirstRun = prefs.getBool(_firstRunKey) ?? true;

    return AppConfig(
      themeMode: ThemeMode.values[savedThemeIndex],
      isFullScreen: savedIsFullScreen,
      isPanelOpen: isPanelOpen,
      sourceDirectory: srcDir,
      targetDirectory: targetDir,
      isFirstRun: isFirstRun
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

  void setSourceDirectory(String? sourceDirectory) {
    state = state.copyWith(sourceDirectory: sourceDirectory);
    if(sourceDirectory != null) {
      ref.read(sharedPreferencesProvider).setString(_srcDirKey, sourceDirectory);
    }
  }

  void setTargetDirectory(String? targetDirectory) {
    state = state.copyWith(targetDirectory: targetDirectory);
    if(targetDirectory != null) {
      ref.read(sharedPreferencesProvider).setString(_targetDirKey, targetDirectory);
    }
  }

  void setFirstRun(bool value) {
    state = state.copyWith(isFirstRun: value);
    ref.read(sharedPreferencesProvider).setBool(_firstRunKey, value);
  }
}

final appConfigProvider = NotifierProvider<AppConfigNotifier, AppConfig>(AppConfigNotifier.new);