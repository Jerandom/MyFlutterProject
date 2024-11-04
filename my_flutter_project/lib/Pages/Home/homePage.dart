import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/homeProvider.dart';
import '../GenericWidget/appBarWidget.dart';

class MyHomePage extends ConsumerStatefulWidget {
  final Widget child;

  const MyHomePage({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appProvider);
    final homeState = ref.watch(homeProvider);


    return Scaffold(
      appBar: AppBarWidget(title: "Home"),
      drawer: DrawerWidget(bUserLoggedIn: appState.setLoginState),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeState.pageIndex,
        onTap: (index) {
          ref.read(homeProvider.notifier).setPageIndex(index);

          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/advancedFeature');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}