import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/Pages/Home/advancedFeaturePage.dart';
import 'package:my_flutter_project/Pages/Home/basicFeaturePage.dart';

import 'Pages/Home/homePage.dart';
import 'Pages/Home/navMainPage.dart';
import 'Pages/Login/loginPage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MyHomePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => BasicFeaturePage(),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => DetailsScreen(),
                routes: [
                  GoRoute(
                    path: 'extra',
                    builder: (context, state) => ExtraScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/advancedFeature',
            builder: (context, state) => AdvancedFeaturePage(),
          ),
        ],
      ),

      //login Screen outside of shell route
      GoRoute(
        path: '/login',
        builder: (context, state) => MyLoginPage(),
      ),
    ],
  );
}