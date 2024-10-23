import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
    
  final String title;
    
  const AppBarWidget({
      super.key, 
      required this.title
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              // Define what happens when the container is clicked
              print("Container clicked");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.notifications, color: Colors.black), // Leading icon
                const SizedBox(width: 8), // Spacing between icon and text
                Text(
                  "Alerts",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
