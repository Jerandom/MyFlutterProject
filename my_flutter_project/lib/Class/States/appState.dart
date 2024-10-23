import 'package:connectivity_plus/connectivity_plus.dart';

enum PlatformMode {
  Android,
  IOS,
  Linux,
  MacOS,
  Windows,
  Web,
  Unknown
}

enum ThemeMode {
  Light,
  Dark,
}

class AppState {
  final PlatformMode platformMode;
  final ThemeMode themeMode;
  final List<ConnectivityResult> connectionStatus;
  final bool userLoggedIn;
  final String errorMsg;

  AppState({
    required this.platformMode,
    required this.themeMode,
    required this.connectionStatus,
    required this.userLoggedIn,
    required this.errorMsg,
  });

  // A convenient method to create initial state
  factory AppState.initial() => AppState(
    platformMode: PlatformMode.Unknown,
    themeMode: ThemeMode.Light,
    connectionStatus: [],
    userLoggedIn: false,
    errorMsg: "",
  );


  // Method to create a copy of the state with some fields replaced
  AppState copyWith({
    PlatformMode? setPlatformMode,
    ThemeMode? setThemeMode,
    List<ConnectivityResult>? setConnectionStatus,
    bool? setUserLoggedIn,
    String? setErrorMsg,
  }) => AppState(
    platformMode: setPlatformMode?? platformMode,
    themeMode: setThemeMode ?? themeMode,
    connectionStatus: setConnectionStatus?? connectionStatus,
    userLoggedIn: setUserLoggedIn?? userLoggedIn,
    errorMsg: setErrorMsg ?? errorMsg,
  );
}

