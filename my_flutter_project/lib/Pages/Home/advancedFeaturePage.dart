import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/homeProvider.dart';
import 'gridViewWidget.dart';

class AdvancedFeaturePage extends ConsumerStatefulWidget {
  const AdvancedFeaturePage({super.key});

  @override
  ConsumerState<AdvancedFeaturePage> createState() => _AdvancedFeaturePageState();
}

class _AdvancedFeaturePageState extends ConsumerState<AdvancedFeaturePage> {

  void onItemTapped(String route, BuildContext context) {

    switch (route) {
      case "Notes":
        context.go('/advancedFeature/notes');
        print("switch to $route");
        break;

      case "Shop":
        context.go('/advancedFeature/shop');
        print("switch to $route");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
        body: Column(
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
                  gridItems: homeState.advancedGridItems,
                  onTap: (index) {
                    onItemTapped(homeState.advancedGridItems[index]['text'], context);
                  },
                ),
              ),
            ]
        )
    );
  }
}