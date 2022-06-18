import 'package:blog_app/widgets/center_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/routes.dart';
import '../widgets/custom_app_bar_action.dart';
import '../widgets/single_user_feed.dart';

class PrimaryFeedScreen extends StatelessWidget {
  const PrimaryFeedScreen({Key? key}) : super(key: key);

  void _onMyGroupsPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toMyGroupsScreen);
  void _onPollsPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toMyPollsScreen);
  void _onFeedTap(BuildContext context) => Navigator.of(context).pushNamed(Routes.toAdminGroupScreen);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Feed'),
          actions: [
            CustomAppBarAction(
              faIcon: FontAwesomeIcons.squarePollVertical,
              onPressed: () => _onPollsPressed(context),
            ),
            CustomAppBarAction(
              faIcon: FontAwesomeIcons.users,
              onPressed: () => _onMyGroupsPressed(context),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: CenterWidget(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SingleUserFeed(
                  onTap: () => _onFeedTap(context),
                  userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/70.jpg',
                  username: 'Jane',
                  feedImageUrl: 'http://picsum.photos/300',
                  feedDescription:
                      'Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! Another Post! ',
                  likesCount: 4,
                ),
                SingleUserFeed(
                  onTap: () => _onFeedTap(context),
                  userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/male/69.jpg',
                  username: 'John',
                  feedImageUrl: 'http://picsum.photos/200',
                  feedDescription:
                      'This is my post description! This is my post description! This is my post description! This is my post description! This is my post description! This is my post description!',
                  likesCount: 3,
                ),
                SingleUserFeed(
                  onTap: () => _onFeedTap(context),
                  userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/20.jpg',
                  username: 'Katie',
                  feedImageUrl: 'http://picsum.photos/500',
                  feedDescription:
                      'Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.Some post.',
                  likesCount: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
