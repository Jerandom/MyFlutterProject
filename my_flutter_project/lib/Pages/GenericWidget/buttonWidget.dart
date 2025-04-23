import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double height;
  final VoidCallback? onTap;

  const ButtonWidget({
    super.key,
    required this.title,
    this.height = 50.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ),
      ),
    ),
  );
}
