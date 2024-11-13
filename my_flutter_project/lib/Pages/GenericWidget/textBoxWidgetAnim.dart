import 'package:flutter/material.dart';

class AnimatedTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;

  const AnimatedTextBox({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText, // Sets the animated label text
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Float when focused
          prefixIcon: Icon(icon), // Adds leading icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Makes the border rounded
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
      ),
    );
  }
}
