import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  //constructor
  ConnectivityService(){
    checkConnection();
  }

  Future<void> checkConnection() async {
    List<ConnectivityResult> results = await Connectivity().checkConnectivity();

    if (results.isNotEmpty) {
      ConnectivityResult result = results.first;

      switch (result) {
        case ConnectivityResult.mobile:
          print("Connected to mobile network");
          break;
        case ConnectivityResult.wifi:
          print("Connected to WiFi");
          break;
        case ConnectivityResult.ethernet:
          print("Connected via Ethernet");
          break;
        case ConnectivityResult.bluetooth:
          print("Connected via bluetooth");
          break;
        case ConnectivityResult.vpn:
          print("Connected via vpn");
          break;
        case ConnectivityResult.other:
          print("Connected via other");
          break;
        case ConnectivityResult.none:
          print("No internet connection");
          break;
      }
    }
    else {
      print("No connectivity results available");
    }
  }

  // start the listener
  void startListening(Function(ConnectivityResult) onChange) {
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty) {
        ConnectivityResult result = results.first;
        onChange(result);
      } else {
        onChange(ConnectivityResult.none);
      }
    });
  }

  // stop the listener when it's no longer needed
  void stopListening() {
    _subscription.cancel();
  }
}
