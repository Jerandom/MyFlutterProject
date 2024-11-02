
import 'package:flutter/material.dart';

class HomeState{
  final int pageIndex;
  final List<Map<String, dynamic>> basicGridItems;
  final List<Map<String, dynamic>> advancedGridItems;

  const HomeState({
    required this.pageIndex,
    required this.basicGridItems,
    required this.advancedGridItems,
  });

  // A convenient method to create initial state
  factory HomeState.initial() => HomeState(
    pageIndex: 0,
    basicGridItems: [
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 1"},
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 2"},
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 3"},
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 4"},
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 5"},
      {'image': "assets/images/ic_launcher.png", 'text': "Basic 5"},
    ],

    advancedGridItems: [
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 1"},
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 2"},
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 3"},
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 4"},
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 5"},
      {'image': "assets/images/ProfileIcon.png", 'text': "Advanced 6"},
    ],
  );

  // Method to create a copy of the state with some fields replaced
  HomeState copyWith({
    int? setPageIndex,
    List<Map<String, dynamic>>? setBasicGridItems,
    List<Map<String, dynamic>>? setAdvancedGridItems,
  }) => HomeState(
    pageIndex: setPageIndex ?? pageIndex,
    basicGridItems: setBasicGridItems ?? basicGridItems,
    advancedGridItems: setAdvancedGridItems ?? advancedGridItems,
  );
}