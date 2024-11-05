import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';
import 'drawerTileWidget.dart';

class DrawerWidget extends ConsumerWidget {

  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return Drawer(
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
                  context.pop();
                },
              ),

              SizedBox(height: 8),

              // Settings
              DrawerTileWidget(
                text: "Settings",
                icon: Icons.settings,
                onTap: () {
                  context.push('/settings');

                  // close the drawer after pressing
                  context.pop();
                },
              ),
            ],
          ),

          appState.userLoggedIn ? _onlineWidget(ref, context) : _offlineWidget(context),
        ],
      ),
    );
  }

  // UI components
  Widget _onlineWidget(WidgetRef ref, BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: DrawerTileWidget(
          text: "Logout",
          icon: Icons.logout,
          onTap: () {
            // Update the provider
            ref.read(appProvider.notifier).setLoginState(false);

            // Close the drawer after pressing
            context.pop();
          },
        ),
      );

  Widget _offlineWidget(BuildContext context) => InkWell(
        onTap: () {
          context.push('/login');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.login, color: Colors.black), // Login icon
            const SizedBox(width: 8),
            Text(
              "Login",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      );
}
