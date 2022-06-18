import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';

class CustomElevatedButton extends StatelessWidget with ResponsiveLayoutMixin {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SizedBox(
      width: contentWidth,
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
