import 'package:flutter/material.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_mode.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final prefs = await SharedPreferences.getInstance();
    final currentMode = prefs.getString(Constants.themeModeKey);
    return ThemeMode.values.firstWhere((value) => currentMode == value.name, orElse: () => ThemeMode.system);
  }

  Future<void> toggleTheme() async {
    if (state.hasValue) {
      final currentTheme = state.value!;
      final newTheme = currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

      await _saveTheme(newTheme);
      state = AsyncValue.data(newTheme);
    }
  }

  Future<void> updateMode(ThemeMode mode) async {
    state = AsyncData(mode);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.themeModeKey, mode.name);
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    switch (mode) {
      case ThemeMode.light:
        await prefs.setString(Constants.themeModeKey, 'light');
        break;
      case ThemeMode.dark:
        await prefs.setString(Constants.themeModeKey, 'dark');
        break;
      case ThemeMode.system:
        await prefs.setString(Constants.themeModeKey, 'system');
        break;
    }
  }
}
