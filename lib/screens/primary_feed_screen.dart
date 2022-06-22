import 'package:blog_app/widgets/center_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_constants.dart';
import '../constants/api_endpoints.dart';
import '../constants/routes.dart';
import '../widgets/custom_app_bar_action.dart';
import '../widgets/single_user_feed.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../services/api_service.dart';
import '../models/single_user_feed_content.dart';
import '../mixins/responsive_layout_mixin.dart';

class PrimaryFeedScreen extends StatefulWidget {
  const PrimaryFeedScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryFeedScreen> createState() => _PrimaryFeedScreenState();
}

class _PrimaryFeedScreenState extends State<PrimaryFeedScreen> with ResponsiveLayoutMixin {
  late bool _isLoading;

  final List<SingleUserFeedContent> _feedContents = [];

  void _onMyGroupsPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toMyGroupsScreen);

  void _onPollsPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toMyPollsScreen);

  void _onPostFetchingSuccess(dynamic response) {
    _isLoading = false;

    final posts = response['data']['post'];

    posts.keys.forEach((k) {
      final firstPostOnEachGroup = posts[k][0];
      final post = SingleUserFeedContent.fromJson(firstPostOnEachGroup);
      _feedContents.add(post);
    });

    setState(() {});
  }

  void _fetchAllGroupPosts() => ApiService.callApi(
        ApiEndpoints.fetchPostsAllGroup,
        RequestType.post,
        requestBody: {
          'userId': AppConstants.authUser!.id.toString(),
        },
        onSuccess: _onPostFetchingSuccess,
        onFailed: () {},
      );

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchAllGroupPosts();
  }

  @override
  Widget build(BuildContext context) {
    final contentHeight = getContentHeight(context, safeAreaPadding: true, keyboardHeight: true);

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
        body: SizedBox(
          height: contentHeight,
          child: CenterWidget(
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  if (_isLoading) const CustomCircularProgressIndicator(),
                  if (!_isLoading && _feedContents.isNotEmpty)
                    ..._feedContents
                        .map(
                          (content) => SingleUserFeed(
                            singleUserFeedContent: content,
                          ),
                        )
                        .toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
