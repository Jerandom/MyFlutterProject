import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/homeProvider.dart';
import 'gridViewWidget.dart';

class BasicFeaturePage extends ConsumerStatefulWidget {
  const BasicFeaturePage({super.key});

  @override
  ConsumerState<BasicFeaturePage> createState() => _BasicFeaturePageState();
}

class _BasicFeaturePageState extends ConsumerState<BasicFeaturePage> {

  void onItemTapped(String route, BuildContext context) {

    switch (route) {
      case "Test":
        context.go('/home/details');
        print("switch to $route");
        break;

      case "Image List":
        context.go('/home/imageList');
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
                  gridItems: homeState.basicGridItems,
                  onTap: (index) {
                    onItemTapped(homeState.basicGridItems[index]['text'], context);
                  },
                ),
              ),
            ]
        )
    );
  }
}