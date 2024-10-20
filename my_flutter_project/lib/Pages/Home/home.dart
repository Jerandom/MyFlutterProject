import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of icons and text for the grid
  final List<Map<String, dynamic>> gridItems = [
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.person, 'text': 'Profile'},
    {'icon': Icons.settings, 'text': 'Settings'},
    {'icon': Icons.shopping_cart, 'text': 'Cart'},
    {'icon': Icons.favorite, 'text': 'Favorites'},
    {'icon': Icons.notifications, 'text': 'Notifications'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add your navigation logic here if necessary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: gridItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Space between columns
          mainAxisSpacing: 16.0, // Space between rows
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle item tap if necessary
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  gridItems[index]['icon'],
                  size: 48.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 8.0),
                Text(
                  gridItems[index]['text'],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
