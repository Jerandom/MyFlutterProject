import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import '../../Class/Providers/homeProvider.dart';
import '../GenericWidget/appBarWidget.dart';
import 'gridViewWidget.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  //function to handle basic navigation
  void handleBasicGridNav(String route){
    switch (route) {
      case "Profile":
        print("switch to $route");
    }
  }

  //function to handle advanced navigation
  void handleAdvancedGridNav(String route){
    switch (route) {
      case "Profile":
        print("switch to $route");
    }
  }

  //UI code here, basic grid widget
  Widget buildBasicGrid(List<Map<String, dynamic>> gridItems) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            // title
            children: [
              const Text(
                "Basic Features",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(width: 8),

              //divider
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridViewWidget(
            gridItems: gridItems,
            onTap: (index) {
              handleBasicGridNav(gridItems[index]['text']);
            },
          ),
        ),
      ]
  );

  //UI code here, advanced grid widget
  Widget buildAdvancedGrid(List<Map<String, dynamic>> gridItems) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            // title
            children: [
              const Text(
                "Advanced Features",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(width: 8),

              //divider
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridViewWidget(
            gridItems: gridItems,
            onTap: (index) {
              handleAdvancedGridNav(gridItems[index]['text']);
            },
          ),
        ),
      ]
  );

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appProvider);
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      appBar: const AppBarWidget(title: "Home"),
      body: IndexedStack(
        index: homeState.pageIndex,
        children: [
          //first route
          buildBasicGrid(homeState.gridItems),

          //second route
          buildAdvancedGrid(homeState.gridItems),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Basic Feature",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Advanced Feature",
          ),
        ],
        currentIndex: homeState.pageIndex,
        onTap: ref.read(homeProvider.notifier).setPageIndex,
      ),
    );
  }
}
