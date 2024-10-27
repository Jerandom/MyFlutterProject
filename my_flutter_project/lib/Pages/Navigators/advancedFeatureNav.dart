import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvancedFeatureNav extends ConsumerStatefulWidget {
  const AdvancedFeatureNav({super.key});

  @override
  ConsumerState<AdvancedFeatureNav> createState() => _AdvancedFeatureNavState();
}

class _AdvancedFeatureNavState extends ConsumerState<AdvancedFeatureNav> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings route) {
        return MaterialPageRoute(
          settings: route,
          builder: (BuildContext context) {
            switch (route.name) {
              case '/details':
                return     Center(child: Text('advanced'));
              default:
                return Center(child: Text('advanced Home'));  // Main page of the navigator
            }
          },
        );
      },
    );
  }
}