import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  final int navIndex;
  final Function(int) onTap;

  const NavigationBarWidget({
    super.key,
    required this.navIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Basic Feature",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Advanced Feature",
        ),
      ],
      currentIndex: navIndex,
      onTap: onTap,
    );
  }
}