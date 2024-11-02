import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/homeProvider.dart';
import '../GenericWidget/appBarWidget.dart';
import 'advancedFeature.dart';
import 'basicFeatureWidget.dart';

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
      appBar: const AppBarWidget(title: "Home"),
      body: Placeholder(),
    );
  }
}

// return Scaffold(
// appBar: const AppBarWidget(title: "Home"),
// body: IndexedStack(
// index: homeState.pageIndex,
// children: [
// //first route
// BasicFeatureWidget(gridItems: homeState.basicGridItems),
//
// //second route
// AdvancedFeatureWidget(gridItems: homeState.advancedGridItems),
// ],
// ),
// bottomNavigationBar: BottomNavigationBar(
// items: const <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: "Basic Feature",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.person),
// label: "Advanced Feature",
// ),
// ],
// currentIndex: homeState.pageIndex,
// onTap: ref.read(homeProvider.notifier).setPageIndex,
// ),
// );
