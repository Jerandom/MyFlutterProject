import 'package:flutter/material.dart';

class TextBoxWidgetAnim extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final FormFieldValidator<String>? validator;

  const TextBoxWidgetAnim({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
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
