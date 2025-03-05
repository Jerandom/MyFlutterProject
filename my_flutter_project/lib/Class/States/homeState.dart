class HomeState {
  final int pageIndex;
  final List<Map<String, dynamic>> offlineGridItems;
  final List<Map<String, dynamic>> onlineGridItems;

  const HomeState({
    required this.pageIndex,
    required this.offlineGridItems,
    required this.onlineGridItems,
  });

  factory HomeState.initial() => HomeState(
      pageIndex: 0,
      offlineGridItems: [
        {'image': "assets/images/ic_launcher.png", 'text': "Test"},
      ],
      onlineGridItems: [
        {'image': "assets/images/notes_advanced.png", 'text': "Notes"},
        {'image': "assets/images/album_basic.png", 'text': "Image List"},
        {'image': "assets/images/shop_advanced.png", 'text': "Shop"},
      ],
    );

  // Method to create a copy of the state with some fields replaced
  HomeState copyWith({
    int? setPageIndex,
    List<Map<String, dynamic>>? setOfflineGridItems,
    List<Map<String, dynamic>>? setOnlineGridItems,
  }) =>
      HomeState(
        pageIndex: setPageIndex ?? pageIndex,
        offlineGridItems: setOfflineGridItems ?? offlineGridItems,
        onlineGridItems: setOnlineGridItems ?? onlineGridItems,
      );
}
