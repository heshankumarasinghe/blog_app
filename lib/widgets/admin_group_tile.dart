import 'package:flutter/material.dart';

import '../widgets/user_avatar.dart';

class AdminGroupTile extends StatelessWidget {
  final String userImageUrl;
  final String groupTitle;

  const AdminGroupTile({
    Key? key,
    required this.userImageUrl,
    required this.groupTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: UserAvatar(
            userImageUrl: userImageUrl,
          ),
          title: Text(
            groupTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
