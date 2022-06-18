import 'package:flutter/material.dart';

class AdminActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AdminActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 25,
      ),
    );
  }
}
