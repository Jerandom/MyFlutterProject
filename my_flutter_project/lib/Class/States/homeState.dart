
import 'package:flutter/material.dart';

class HomeState{
  final int pageIndex;
  final List<Map<String, dynamic>> gridItems;

  const HomeState({
    required this.pageIndex,
    required this.gridItems,
  });

  // A convenient method to create initial state
  factory HomeState.initial() => HomeState(
    pageIndex: 0,
    gridItems: [
      {'image': "assets/images/ic_launcher.png", 'text': "Home"},
      {'image': "assets/images/ic_launcher.png", 'text': "Profile"},
      {'image': "assets/images/ic_launcher.png", 'text': "Settings"},
      {'image': "assets/images/ic_launcher.png", 'text': "Cart"},
      {'image': "assets/images/ic_launcher.png", 'text': "Favorites"},
      {'image': "assets/images/ic_launcher.png", 'text': "Notifications"},
    ],
  );

  // Method to create a copy of the state with some fields replaced
  HomeState copyWith({
    int? setPageIndex,
    List<Map<String, dynamic>>? setGridItems,
  }) => HomeState(
    pageIndex: setPageIndex ?? pageIndex,
    gridItems: setGridItems ?? gridItems,
  );
}