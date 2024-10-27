import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicFeatureNav extends ConsumerStatefulWidget {
  const BasicFeatureNav({super.key});

  @override
  ConsumerState<BasicFeatureNav> createState() => _BasicFeatureNavState();
}

class _BasicFeatureNavState extends ConsumerState<BasicFeatureNav> {
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
              case '/Profile':
                return Center(child: Text('Basic'));
              default:
                return Center(child: Text('Basic Home')); // Main page of the navigator
            }
          },
        );
      },
    );
  }
}
