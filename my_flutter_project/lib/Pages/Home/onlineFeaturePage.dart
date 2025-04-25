import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/homeProvider.dart';
import 'gridViewWidget.dart';

class OnlineFeaturePage extends ConsumerStatefulWidget {
  const OnlineFeaturePage({super.key});

  @override
  ConsumerState<OnlineFeaturePage> createState() => _OnlineFeaturePageState();
}

class _OnlineFeaturePageState extends ConsumerState<OnlineFeaturePage> {

  void onItemTapped(String route, BuildContext context) {

    switch (route) {
      case "Notes":
        context.go('/onlineFeature/notes');
        print("switch to $route");
        break;
      
      case "Image List":
        context.go('/onlineFeature/imageList');
        print("switch to $route");
        break;

      case "Shop":
        context.go('/onlineFeature/shop');
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
                      "Online Features",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(width: 8),

                    //divider
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridViewWidget(
                  gridItems: homeState.onlineGridItems,
                  onTap: (index) {
                    onItemTapped(homeState.onlineGridItems[index]['text'], context);
                  },
                ),
              ),
            ]
        )
    );
  }
}