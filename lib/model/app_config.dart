import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';

@freezed
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(false) bool isFullScreen,
    @Default(false) bool isPanelOpen,
  }) = _AppConfig;
}