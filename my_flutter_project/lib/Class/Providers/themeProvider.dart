import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeState.initial()) {
    // constructor
  }

  // Toggle between light and dark mode
  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    state = state.copyWith(
        setThemeMode: newThemeMode,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeState>((ref) {
  return ThemeProvider();
});