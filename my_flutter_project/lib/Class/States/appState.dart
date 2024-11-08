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

class AppState {
  final PlatformMode platformMode;
  final List<ConnectivityResult> connectionStatus;
  final bool userLoggedIn;
  final String errorMsg;

  AppState({
    required this.platformMode,
    required this.connectionStatus,
    required this.userLoggedIn,
    required this.errorMsg,
  });

  // A convenient method to create initial state
  factory AppState.initial() => AppState(
    platformMode: PlatformMode.Unknown,
    connectionStatus: [],
    userLoggedIn: false,
    errorMsg: "",
  );


  // Method to create a copy of the state with some fields replaced
  AppState copyWith({
    PlatformMode? setPlatformMode,
    List<ConnectivityResult>? setConnectionStatus,
    bool? setUserLoggedIn,
    String? setErrorMsg,
  }) => AppState(
    platformMode: setPlatformMode?? platformMode,
    connectionStatus: setConnectionStatus?? connectionStatus,
    userLoggedIn: setUserLoggedIn?? userLoggedIn,
    errorMsg: setErrorMsg ?? errorMsg,
  );
}

