import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget{
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const DrawerTileWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      )
  );
}