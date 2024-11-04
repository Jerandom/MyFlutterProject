import 'package:flutter/material.dart';

import 'drawerTileWidget.dart';

class DrawerWidget extends StatelessWidget{
  final bool bUserLoggedIn;

  const DrawerWidget({
    super.key,
    required this.bUserLoggedIn,
  });

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Theme.of(context).colorScheme.surface,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            //drawer header: logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            SizedBox(height: 25),

            // tile
            DrawerTileWidget(
              text: "Tile",
              icon: Icons.home,
              onTap: () {
                // close the drawer after pressing
                Navigator.pop(context);
              },
            ),

            SizedBox(height: 8),

            // Settings
            DrawerTileWidget(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                context.push('/settings')

                // close the drawer after pressing
                Navigator.pop(context);
              },
            ),
          ],
        ),
        // Logout Tile
        if(bUserLoggedIn)
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: DrawerTileWidget(
              text: "Logout",
              icon: Icons.logout,
              onTap: () {
                // close the drawer after pressing
                Navigator.pop(context);
              },
            ),
          ),
      ],
    ),
  );
}