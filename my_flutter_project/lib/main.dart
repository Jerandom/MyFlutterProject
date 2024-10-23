import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        "/home": (context) => const MyHomePage(),
        "/login": (context) => const MyLoginPage(),
        "/imageList": (context) => const MyImageListPage(),
        //"/testFile": (context) => MyTestFile(),
      },
    );
  }
}
