class OnBoardingState{
    final int pageIndex;
    final List<Map<String, dynamic>> onboardingItems;

    const HomeState({
    required this.pageIndex,
    required this.onboardingItems,
  });
}

class OnBoardingState {
  final int pageIndex;
  final List<Map<String, dynamic>> onboardingItems;

  const OnBoardingState({
    required this.pageIndex,
    required this.onboardingItems,
  });

  factory OnBoardingState.initial() => OnBoardingState(
      pageIndex: 0,
      onboardingItems: [
      {
        "image": "assets/gifs/",
        "title": "Welcome",
        "subtitle": "Let's get started!"
      },
      {
        "image": "assets/gifs/",
        "title": "Discover",
        "subtitle": "Find what you need easily."
      },
      {
        "image": "assets/gifs/",
        "title": "Enjoy",
        "subtitle": "Have a great experience."
      },
      ],
    );

  // Method to create a copy of the state with some fields replaced
  OnBoardingState copyWith({
    int? setPageIndex,
    List<Map<String, dynamic>>? setOnboardingItems,
  }) =>
      OnBoardingState(
        pageIndex: setPageIndex ?? pageIndex,
        onboardingItems: setOnboardingItems ?? onboardingItems,
      );
}