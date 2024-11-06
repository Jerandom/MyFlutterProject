import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../States/firebaseState.dart';

class FirebaseProvider extends StateNotifier<FirebaseState> {
    FirebaseProvider() : super (FirebaseState.initial()) {
        // constructor
    }

    // method to set the connection status
    void setIsConnected(bool bResult){
        state = state.copyWith(
            setIsConnected: bResult,
        );
    }
}

// Define a provider for the FirebaseProvider
final firebaseProvider = StateNotifierProvider<FirebaseProvider, FirebaseState>((ref) {
    return FirebaseProvider();
});