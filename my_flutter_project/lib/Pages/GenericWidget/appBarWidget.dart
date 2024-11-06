import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Class/Providers/appProvider.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // Opens the drawer
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: appState.userLoggedIn ? _onlineWidget(ref, context) : _offlineWidget(context)),
      ],
    );
  }

  //UI components
  Widget _onlineWidget(WidgetRef ref, BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person),
          const SizedBox(width: 4),
          Text(
            "Dummy Name",
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
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
