import 'package:flutter/material.dart';

class ClickableTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const ClickableTextWidget({
    super.key,
    required this.title,
    this.color = Colors.blue,
    this.onTap,
  });

    @override
    Widget build(BuildContext context) => GestureDetector (
        onTap: onTap,
        child: Text(title,
            style: TextStyle (
                color: color,
            ),
        ),
    );
}