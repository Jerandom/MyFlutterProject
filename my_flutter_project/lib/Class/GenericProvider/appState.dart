import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

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
  final String errorMsg;

  AppState({
    required this.platformMode,
    required this.themeMode,
    required this.connectionStatus,
    required this.errorMsg,
  });

  // A convenient method to create initial state
  factory AppState.initial() => AppState(
    platformMode: PlatformMode.Unknown,
    themeMode: ThemeMode.Light,
    connectionStatus: [],
    errorMsg: "",
  );


  // Method to create a copy of the state with some fields replaced
  AppState copyWith({
    PlatformMode? setPlatformMode,
    ThemeMode? setThemeMode,
    List<ConnectivityResult>? setConnectionStatus,
    String? setErrorMsg,
  }) => AppState(
    platformMode: setPlatformMode?? platformMode,
    themeMode: setThemeMode ?? themeMode,
    connectionStatus: setConnectionStatus?? connectionStatus,
    errorMsg: setErrorMsg ?? errorMsg,
  );
}


// Define a state notifier for managing the app state
class AppStateManager extends StateNotifier<AppState> {
  AppStateManager() : super(AppState.initial()) {
    // Constructor
    _listenToConnectivityChanges();
    _setPlatformMode();
    _setThemeMode();
  }

  // Function to update connectivity state
  void setConnected(List<ConnectivityResult> result) {
    state = state.copyWith(
      setConnectionStatus: result,
    );
  }

  // Function to update theme
  void setTheme(ThemeMode themeMode){
    state = state.copyWith(
      setThemeMode: themeMode,
    );
  }

  // Function to update error message state
  void setErrorMsg(String errorMsg) {
    state = state.copyWith(
      setErrorMsg: errorMsg,
    );
  }

  //clear
  void clearErrorMsg(){
    state = state.copyWith(
      setErrorMsg: "",
    );
  }

  // Function to listen for connectivity changes
  void _listenToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result){
      setConnected(result);
      print(result);
    });
  }

  // Function to update Platform state
  void _setPlatformMode() {
    PlatformMode platformMode;

    if (kIsWeb) {
      platformMode = PlatformMode.Web;
      print("Web");
    } else if (Platform.isLinux) {
      platformMode = PlatformMode.Linux;
      print("Linux");
    } else if (Platform.isMacOS) {
      platformMode = PlatformMode.MacOS;
      print("MacOS");
    } else if (Platform.isWindows) {
      platformMode = PlatformMode.Windows;
      print("windows");
    } else if (Platform.isAndroid) {
      platformMode = PlatformMode.Android;
      print("Android");
    } else if (Platform.isIOS) {
      platformMode = PlatformMode.IOS;
      print("IOS");
    } else {
      platformMode = PlatformMode.Unknown;
      print("Unknown");
    }

    state = state.copyWith(
        setPlatformMode: platformMode);
  }

  void _setThemeMode(){
    print(state.themeMode);
  }
}

// Define a provider for the StateManager
final appStateProvider = StateNotifierProvider<AppStateManager, AppState>((ref) {
  return AppStateManager();
});