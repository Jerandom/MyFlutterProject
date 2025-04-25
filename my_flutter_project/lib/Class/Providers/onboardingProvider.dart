import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a state notifier for managing the app state
class OnBoardingProvider extends StateNotifier<OnBoardingState> {
  OnBoardingProvider() : super(OnBoardingState.initial()) {
    //constructor
  }

  // jump to the specific dot selected page
  void dotNavigationClick(int index) {
    
  } 

  // update current index & jump to next page
  void nextPage() {

  }

  // update current index & jump to last page
  void skipPage() {

  }

  // method to set the page index
  void setPageIndex(int index){
    state = state.copyWith(
      setPageIndex: index,
    );
  }
}

// Define a provider for OnBoarding Provider
final onboardingProvider = StateNotifierProvider<OnBoardingProvider, OnBoardingState>((ref) {
  return OnBoardingProvider();
});