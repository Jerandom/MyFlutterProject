import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final double size;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const IconButtonWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.bgColor = Colors.white70,
    this.textColor = Colors.black54,
    this.size = 32,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              width: size,
              height: size,
            ),
          ),
        ),
        SizedBox(height: 8), // Spacing between icon and text
        Text(
          title,
          style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
