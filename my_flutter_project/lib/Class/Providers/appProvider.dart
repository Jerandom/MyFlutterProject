import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import '../States/appState.dart';

// Define a state notifier for managing the app state
class AppProvider extends StateNotifier<AppState> {
  AppProvider() : super(AppState.initial()) {
    // Constructor
    _listenToConnectivityChanges();
    _setPlatformMode();
    _setThemeMode();
  }

  // Function to update theme
  void setTheme(ThemeMode themeMode){
    state = state.copyWith(
      setThemeMode: themeMode,
    );
  }

  // Function to update login state
  void setLoginState(bool loginState){
    state = state.copyWith(
      setUserLoggedIn: loginState,
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
      state = state.copyWith(
        setConnectionStatus: result,
      );
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
final appProvider = StateNotifierProvider<AppProvider, AppState>((ref) {
  return AppProvider();
});