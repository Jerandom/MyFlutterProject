import 'package:flutter/material.dart';

class TextBoxWidget extends StatefulWidget {
  const TextBoxWidget({
    super.key, required
    this.headerText,
    this.hintText = '',
    this.obscureText = false,
    this.height = 100,
  });

  final String headerText;
  final String hintText;
  final bool obscureText;
  final double height;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height, // Set the height as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.headerText),
          const SizedBox(height: 8), // Space between text and text field
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.hintText,
            ),
            obscureText: widget.obscureText,
          ),
        ],
      ),
    );
  }
}
