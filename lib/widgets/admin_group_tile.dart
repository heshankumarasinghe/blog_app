import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/routes.dart';
import '../widgets/user_avatar.dart';
import '../models/admin_group.dart';

class AdminGroupTile extends StatelessWidget {
  final AdminGroup adminGroup;

  const AdminGroupTile({
    Key? key,
    required this.adminGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.toAdminGroupScreen, arguments: {
        'groupId': adminGroup.id,
      }),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const UserAvatar(
              userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/70.jpg',
            ),
            title: Text(
              adminGroup.groupName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
