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
        {'image': "", 'title': "This is a title", 'subtitle': "This is a subtitle"},
        {'image': "", 'title': "This is a title", 'subtitle': "This is a subtitle"},
        {'image': "", 'title': "This is a title", 'subtitle': "This is a subtitle"},
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