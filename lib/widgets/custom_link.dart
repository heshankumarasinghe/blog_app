import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomLink extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;

  const CustomLink({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            FaIcon(
              icon,
              color: Theme.of(context).primaryColorDark,
            ),
          if (icon != null)
            const SizedBox(
              width: 10,
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
