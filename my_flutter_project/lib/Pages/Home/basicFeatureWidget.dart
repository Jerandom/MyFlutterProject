import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gridViewWidget.dart';

class BasicFeatureWidget extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;

  const BasicFeatureWidget({
    super.key,
    required this.gridItems,
  });

  void onItemTapped(String route, BuildContext context) {
    final router = GoRouter.of(context);

    switch (route) {
      case "Basic 1":
        router.go('/home/Basic1');
        print("switch to $route");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              // title
              children: [
                const Text(
                  "Basic Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(width: 8),

                //divider
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridViewWidget(
              gridItems: gridItems,
              onTap: (index) {
                onItemTapped(gridItems[index]['text'], context);
              },
            ),
          ),
        ]
    );
  }
}