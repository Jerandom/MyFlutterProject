import 'package:flutter/material.dart';

enum KeyboardMode { 
  text, 
  number,
}

class TextBoxWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final KeyboardMode keyboardMode;
  final String hint;
  final bool bObscureText;

  const TextBoxWidget({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardMode = KeyboardMode.text,
    this.hint = "",
    this.bObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8.0),
          TextField(
            controller: controller,
            keyboardType: keyboardMode == KeyboardMode.number
                ? TextInputType.number
                : TextInputType.text,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: hint,
            ),

            obscureText: bObscureText,
          ),
        ],
      ),
    );
  }
}
