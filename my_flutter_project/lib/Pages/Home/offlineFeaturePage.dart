import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/homeProvider.dart';
import 'gridViewWidget.dart';

class OfflineFeaturePage extends ConsumerStatefulWidget {
  const OfflineFeaturePage({super.key});

  @override
  ConsumerState<OfflineFeaturePage> createState() => _OfflineFeaturePageState();
}

class _OfflineFeaturePageState extends ConsumerState<OfflineFeaturePage> {

  void onItemTapped(String route, BuildContext context) {

    switch (route) {
      case "Test":
        context.go('/home/details');
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
                      "Offline Features",
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
                  gridItems: homeState.offlineGridItems,
                  onTap: (index) {
                    onItemTapped(homeState.offlineGridItems[index]['text'], context);
                  },
                ),
              ),
            ]
        )
    );
  }
}