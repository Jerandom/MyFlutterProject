import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Pages/Home/homePage.dart';
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
      GoRoute(
        path: '/login',
        builder: (context, state) => MyLoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MyHomePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => Container(),
            routes: [
              GoRoute(
                path: 'Basic1',
                builder: (context, state) => Center(child: Text("Basic 1")),
              )
            ]
          ),
        ],
      ),
    ],
  );
}