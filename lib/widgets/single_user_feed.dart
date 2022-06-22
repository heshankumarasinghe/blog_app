import 'package:blog_app/widgets/center_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/routes.dart';
import '../mixins/responsive_layout_mixin.dart';
import './main_feed_content.dart';
import './user_avatar.dart';
import '../models/single_user_feed_content.dart';
import '../utils/toast_util.dart';
import '../utils/alert_util.dart';

class SingleUserFeed extends StatelessWidget with ResponsiveLayoutMixin {
  final SingleUserFeedContent singleUserFeedContent;

  void _onConfirmSubscription(BuildContext context) {
    ToastUtil.showToast(
      msg: 'Subscribed to this group',
      integrity: ToastIntegrity.success,
    );
    Navigator.of(context).popAndPushNamed(Routes.toAdminGroupScreen);
  }

  void _onPostTap(BuildContext context) => AlertUtil.showAlert(
        context,
        content: Row(
          children: const [
            Flexible(
              child: Text(
                'Are you sure you want to subscribe to this group?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        onOk: () => _onConfirmSubscription(context),
      );

  const SingleUserFeed({
    Key? key,
    required this.singleUserFeedContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return Column(
      children: [
        SizedBox(
          width: contentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserAvatar(
                userImageUrl: singleUserFeedContent.userImageUrl,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                singleUserFeedContent.username,
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
        GestureDetector(
          onTap: () => _onPostTap(context),
          child: MainFeedContent(
            feedImageUrl: singleUserFeedContent.feedImageUrl,
            feedDescription: singleUserFeedContent.feedDescription,
            likesCount: singleUserFeedContent.likesCount,
          ),
        ),
      ],
    );
  }
}
