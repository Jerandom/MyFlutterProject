class HomeState {
  final int pageIndex;
  final List<Map<String, dynamic>> basicGridItems;
  final List<Map<String, dynamic>> advancedGridItems;

  const HomeState({
    required this.pageIndex,
    required this.basicGridItems,
    required this.advancedGridItems,
  });

  factory HomeState.initial() => HomeState(
      pageIndex: 0,
      basicGridItems: [
        {'image': "assets/images/ic_launcher.png", 'text': "Test"},
        {'image': "assets/images/album_basic.png", 'text': "Image List"},
      ],
      advancedGridItems: [
        {'image': "assets/images/notes_advanced.png", 'text': "Notes"},
        {'image': "assets/images/shop_advanced.png", 'text': "Shop"},
      ],
    );

  // Method to create a copy of the state with some fields replaced
  HomeState copyWith({
    int? setPageIndex,
    List<Map<String, dynamic>>? setBasicGridItems,
    List<Map<String, dynamic>>? setAdvancedGridItems,
  }) =>
      HomeState(
        pageIndex: setPageIndex ?? pageIndex,
        basicGridItems: setBasicGridItems ?? basicGridItems,
        advancedGridItems: setAdvancedGridItems ?? advancedGridItems,
      );
}
