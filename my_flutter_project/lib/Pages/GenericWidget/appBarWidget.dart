import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_project/Pages/Login/loginPage.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String name;
  final bool isLoggedIn;

  const AppBarWidget({
    super.key, 
    required this.title,
    this.name = "";
    required this.isLoggedIn;
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
          child: isLoggedIn
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person),
                    const SizedBox(width: 4),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                )
              : InkWell(
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}