import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

enum PlatformMode {
  Android,
  IOS,
  Linux,
  MacOS,
  Windows,
  Unknown
}

class AppState {
  final PlatformMode platformMode;
  final ConnectivityResult connectionStatus;
  final String errorMsg;

  AppState({
    required this.platformMode,
    required this.connectionStatus,
    required this.errorMsg,
  });

  // A convenient method to create initial state
  factory AppState.initial() {
    return AppState(
      platformMode: PlatformMode.Unknown,
      connectionStatus: ConnectivityResult.none,
      errorMsg: "",
    );
  }

  // Method to create a copy of the state with some fields replaced
  AppState copyWith({
    PlatformMode? setPlatformMode,
    ConnectivityResult? setConnectionStatus,
    String? setErrorMsg,
  }) {
    return AppState(
      platformMode: setPlatformMode?? platformMode,
      connectionStatus: setConnectionStatus?? connectionStatus,
      errorMsg: setErrorMsg ?? errorMsg,
    );
  }
}

// Define a state notifier for managing the app state
class AppStateManager extends StateNotifier<AppState> {
  AppStateManager() : super(AppState.initial()) {
    // Constructor
    _setPlatformMode();
  }

  // Function to update connectivity state
  void setConnected(ConnectivityResult result) {
    state = state.copyWith(
      setConnectionStatus: result,
    );
  }

  // Function to update error message state
  void setErrorMsg(String errorMsg) {
    state = state.copyWith(
      setErrorMsg: errorMsg,
    );
  }

  void clearErrorMsg(){
    state = state.copyWith(
      setErrorMsg: "",
    );
  }

  // Function to update Platform state
  void _setPlatformMode() {
    PlatformMode platformMode;

    if (Platform.isAndroid) {
      platformMode = PlatformMode.Android;
    } else if (Platform.isIOS) {
      platformMode = PlatformMode.IOS;
    } else if (Platform.isLinux) {
      platformMode = PlatformMode.Linux;
    } else if (Platform.isMacOS) {
      platformMode = PlatformMode.MacOS;
    } else if (Platform.isWindows) {
      platformMode = PlatformMode.Windows;
      print("windows");
    } else {
      platformMode = PlatformMode.Unknown;
    }

    state = state.copyWith(
        setPlatformMode: platformMode);
  }
}

// Define a provider for the StateManager
final appStateProvider = StateNotifierProvider<AppStateManager, AppState>((ref) {
  return AppStateManager();
});