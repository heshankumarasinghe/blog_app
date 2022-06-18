import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String userImageUrl;

  const UserAvatar({
    Key? key,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(userImageUrl),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50 / 2),
        ),
        border: Border.all(
          width: 3.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
