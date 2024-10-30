import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Pages/Home/homePage.dart';
import 'Pages/Login/loginPage.dart';
import 'Pages/ImageList/imageListPage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MyHomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/BasicFeature'
          name: RouteClass.BasicFeature,
          builder: (context, state) => BasicFeatureWidget(),
          routes: [
            GoRoute(
              path: 'SubPage1',
              builder: (context, state) => SubPage1(),
            ),
            GoRoute(
              path: 'SubPage2',
              builder: (context, state) => SubPage2(),
            ),
          ],
        ),
        GoRoute(
          path: '/page2',
          builder: (context, state) => Page2(),
        ),
        GoRoute(
          path: '/page3',
          builder: (context, state) => Page3(),
        ),
      ],
    ),
  ],
);