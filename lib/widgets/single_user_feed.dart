import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';
import './main_feed_content.dart';
import './user_avatar.dart';

class SingleUserFeed extends StatelessWidget with ResponsiveLayoutMixin {
  final String userImageUrl;
  final String username;
  final String feedImageUrl;
  final String feedDescription;
  final int likesCount;
  final VoidCallback onTap;

  const SingleUserFeed({
    Key? key,
    required this.userImageUrl,
    required this.username,
    required this.feedImageUrl,
    required this.feedDescription,
    required this.likesCount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: contentWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAvatar(
                  userImageUrl: userImageUrl,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MainFeedContent(
            feedImageUrl: feedImageUrl,
            feedDescription: feedDescription,
            likesCount: likesCount,
          ),
        ],
      ),
    );
  }
}
