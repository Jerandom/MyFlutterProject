import 'package:flutter/material.dart';

class SnackBarWidget {
  final String title;
  final Duration duration;
  final Color backgroundColor;

  // Constructor with optional parameters for customization
  SnackBarWidget({
    required this.title,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor = Colors.blue,
  });

  // Method to show the SnackBar
  void show(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text(title),
      duration: duration,
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}