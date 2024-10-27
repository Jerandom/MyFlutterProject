import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../States/shopState.dart';

// Define a state notifier for managing the app state
class ShopProvider extends StateNotifier<ShopState> {
  ShopProvider() : super(ShopState.initial()) {
    // Constructor
  }
}

// Define a provider for the StateManager
final shopProvider = StateNotifierProvider<ShopProvider, ShopState>((ref) {
    return ShopProvider();
});