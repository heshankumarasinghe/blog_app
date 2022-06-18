import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBarAction extends StatelessWidget {
  final IconData faIcon;
  final VoidCallback onPressed;

  const CustomAppBarAction({
    Key? key,
    required this.faIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        faIcon,
      ),
      onPressed: onPressed,
    );
  }
}
