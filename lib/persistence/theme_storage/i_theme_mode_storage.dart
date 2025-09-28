import 'package:flutter/material.dart';

/// Persistent storage for theme mode.
abstract class IThemeModeStorage {
  /// Очистить все данные хранилища.
  Future<void> clear();

  /// Returns saved theme mode.
  Future<ThemeMode> getThemeMode();

  /// Save selected theme mode.
  Future<void> saveThemeMode({required ThemeMode mode});
}
