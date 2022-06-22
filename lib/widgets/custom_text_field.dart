import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? errorText;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.errorText,
    this.obscureText = false,
    this.maxLines,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        errorText: errorText,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
