import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputMode {
  number,
  text,
}

class TextBoxWidget extends StatefulWidget {
  const TextBoxWidget({
    super.key,
    required this.headerText,
    this.hintText = '',
    this.bTextDisplay = true,
    this.obscureText = false,
    this.height = 100,
    this.inputMode = InputMode.text,
    this.controller,
    this.hasError,
  });

  final TextEditingController? controller;
  final String headerText;
  final String hintText;
  final bool bTextDisplay;
  final bool obscureText;
  final double height;
  final InputMode inputMode;
  final Function(bool?)? hasError;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  late TextEditingController _controller;
  String? errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_validateInput);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _validateInput() {
    bool bError = false;

    final String text = _controller.text.trim();
    final int? intValue = int.tryParse(text);

    switch(widget.inputMode){
      case InputMode.number:
        if(text.isEmpty) {
          errorText = "Please enter a valid number";
          bError = true;
        }
        break;

      case InputMode.text:
        if(text.isEmpty) {
          errorText = "Please enter a valid value";
          bError = true;
        }
        break;
    }

    //update state with error status
    setState(() {
      if(widget.hasError != null) {
        widget.hasError!(bError);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.bTextDisplay) ...[
            Text(widget.headerText),
            const SizedBox(height: 8),
          ],
          Flexible(
            child: TextField(
              controller: _controller,
              keyboardType: widget.inputMode == InputMode.number
                  ? const TextInputType.numberWithOptions(decimal: false)
                  : TextInputType.text,
              inputFormatters: widget.inputMode == InputMode.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.hintText,
                errorText: errorText,
              ),
              obscureText: widget.obscureText,
            ),
          ),
        ],
      ),
    );
  }
}
