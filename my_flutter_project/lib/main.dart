import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_project/Class/States/themeState.dart';

import 'Class/Providers/appProvider.dart';
import 'Class/Providers/themeProvider.dart';
import 'Class/Theme/theme.dart';
import 'Pages/Home/advancedFeaturePage.dart';
import 'Pages/Home/basicFeaturePage.dart';
import 'Pages/Home/homePage.dart';
import 'Pages/Home/testPage.dart';
import 'Pages/ImageList/imageListPage.dart';
import 'Pages/Login/createAccountPage.dart';
import 'Pages/Login/loginPage.dart';
import 'Pages/Notes/notesPage.dart';
import 'Pages/Settings/settingsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase_core initialize
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBHyoquHYN3TpHa7rSlUqZyNbD4bRNoQag",
        authDomain: "myflutterfirebase-2a9a2.firebaseapp.com",
        projectId: "myflutterfirebase-2a9a2",
        storageBucket: "myflutterfirebase-2a9a2.firebasestorage.app",
        messagingSenderId: "103242293448",
        appId: "1:103242293448:web:f9f3d9fdf9170c9d9805fd"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  //cloud_firestore
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );

  runApp(ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    final themeState = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeState.themeMode,
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

          /* ====================== BASIC FEATURE ROUTE ====================== */

          // basic feature tab
          GoRoute(
            path: '/home',
            builder: (context, state) => BasicFeaturePage(),
            routes: [
              // test details
              GoRoute(
                path: 'details',
                builder: (context, state) => DetailsScreen(),
                routes: [
                  // test extra
                  GoRoute(
                    path: 'extra',
                    builder: (context, state) => ExtraScreen(),
                  ),
                ],
              ),

              /* ====================== NESTED BASIC FEATURE ROUTE ====================== */

              // image list
              GoRoute(
                path: 'imageList',
                builder: (context, state) => MyImageListPage(),
              ),
            ],
          ),

          /* ====================== ADVANCED FEATURE ROUTE ====================== */

          // advacend feature tab
          GoRoute(
            path: '/advancedFeature',
            builder: (context, state) => AdvancedFeaturePage(), 
            routes: [

              /* ====================== NESTED ADVANCED FEATURE ROUTE ====================== */
              
              // notes
              GoRoute(
                path: 'notes',
                builder: (context, state) => MyNotesPage(),
              )

              // shop
              GoRoute(
                path: 'shop',
                builder: (context, state) => MyShopPage(),
              )
            ],
          ),
        ],
      ),

      /* ====================== OUTSIDE SHELL ROUTE ====================== */

      //login screen
      GoRoute(
        path: '/login',
        builder: (context, state) => MyLoginPage(),
        routes: [
          GoRoute(
            path: 'createAccount',
            builder: (context, state) => MyCreateAccountPage(),
          ),
        ],
      ),

      //settings screen
      GoRoute(
        path: '/settings',
        builder: (context, state) => MySettingsPage(),
      )
    ],
  );
}