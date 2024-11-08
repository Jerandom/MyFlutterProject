import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({
    required this.themeMode,
    });

  // A convenient method to create initial state
  factory ThemeState.initial() => ThemeState(
    themeMode: ThemeMode.light,
  );

  // Method to create a copy of the state with some fields replaced
  ThemeState copyWith({
    ThemeMode? setThemeMode,
  }) => ThemeState(
    themeMode: setThemeMode ?? themeMode
  );
}
