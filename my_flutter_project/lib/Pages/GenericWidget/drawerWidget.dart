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
                    Icons.person,
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
                  Navigator.of(context).pop();
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),

          appState.userLoggedIn ? _onlineWidget(ref, context) : _offlineWidget(),
        ],
      ),
    );
  }

  // UI components
  Widget _onlineWidget(WidgetRef ref, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: DrawerTileWidget(
        text: "Logout",
        icon: Icons.logout,
        onTap: () {
          // sign out from auth
          ref.read(fsUserAccState.notifier).signOut();

          // Update the app provider
          ref.read(appProvider.notifier).setLoginState(false);

          // Close the drawer after pressing
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _offlineWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Text("Please Log In",
          style: const TextStyle(fontSize: 16),
        ),
      );
}
