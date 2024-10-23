import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../States/homeState.dart';

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super (HomeState.initial()) {
    // constructor
  }

  // method to set the page index
  void setPageIndex(int index){
    state = state.copyWith(
      setPageIndex: index,
    );
  }
}

// Define a provider for the ImageIndexProvider
final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});