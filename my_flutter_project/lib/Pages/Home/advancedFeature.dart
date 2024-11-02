import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gridViewWidget.dart';

class AdvancedFeatureWidget extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;

  const AdvancedFeatureWidget({
    super.key,
    required this.gridItems,
  });

  @override
  Widget build(BuildContext context) {
    void onItemTapped(String route) {
      final router = GoRouter.of(context);

      switch (route) {
        case "Advanced 1":
        //router.go('/advanced');
          print("switch to $route");
          break;
      }
    }

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              // title
              children: [
                const Text(
                  "Advanced Features",
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
                onItemTapped(gridItems[index]['text']);
              },
            ),
          ),
        ]
    );
  }
}