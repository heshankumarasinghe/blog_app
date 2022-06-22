import 'dart:convert';

import 'package:blog_app/widgets/center_widget.dart';
import 'package:blog_app/widgets/single_user_feed.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/api_endpoints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/admin_action_button.dart';
import '../widgets/main_feed_content.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/single_poll.dart';
import '../services/api_service.dart';
import '../models/single_user_feed_content.dart';
import '../models/single_poll_content.dart';
import '../constants/routes.dart';

class AdminGroupScreen extends StatefulWidget {
  final int groupId;

  const AdminGroupScreen({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  @override
  State<AdminGroupScreen> createState() => _AdminGroupScreenState();
}

class _AdminGroupScreenState extends State<AdminGroupScreen> with ResponsiveLayoutMixin {
  late bool _isLoading;

  final List<SingleUserFeedContent> _feedContent = [];
  final List<SinglePollContent> _pollsList = [];

  void _onPostFetchingSuccess(dynamic response) {
    final posts = response['data']['post'];
    posts.forEach(
      (post) => _feedContent.add(
        SingleUserFeedContent.fromJson(post),
      ),
    );

    setState(() {});
  }

  void _onPollFetchingSuccess(dynamic response) {
    final polls = response['data']['post'];
    polls.forEach(
      (poll) => _pollsList.add(
        SinglePollContent.fromJson(poll),
      ),
    );

    setState(() {});
  }

  void _fetchInitialData(
    String endpoint,
    Function(dynamic) onSuccess,
  ) {
    ApiService.callApi(
      endpoint,
      RequestType.post,
      requestBody: {
        'groupId': widget.groupId.toString(),
      },
      onSuccess: onSuccess,
      onFailed: () {},
    );
  }

  void _onAddPostPress(BuildContext context) => Navigator.of(context).pushNamed(Routes.toAddPostScreen);

  void _onAddPollPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toAddPollScreen);

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchInitialData(ApiEndpoints.fetchPostsForGroup, _onPostFetchingSuccess);
    _fetchInitialData(ApiEndpoints.fetchPollsForGroup, _onPollFetchingSuccess);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);
    final contentHeight = getContentHeight(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Admin Group'),
          centerTitle: true,
        ),
        body: SizedBox(
          height: contentHeight,
          child: CenterWidget(
            widget: SizedBox(
              width: contentWidth,
              child: _isLoading
                  ? const Center(
                      child: CustomCircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        if (AppConstants.authUser!.isAdmin)
                          const SizedBox(
                            height: 30,
                          ),
                        if (AppConstants.authUser!.isAdmin)
                          SizedBox(
                            width: contentWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AdminActionButton(
                                  icon: Icons.post_add,
                                  onTap: () => _onAddPostPress(context),
                                ),
                                AdminActionButton(
                                  icon: Icons.how_to_vote,
                                  onTap: () => _onAddPollPressed(context),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 35,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: _isLoading
                                ? const Center(
                                    child: CustomCircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [
                                      Column(
                                        children: _feedContent
                                            .map(
                                              (singleFeed) => SingleUserFeed(singleUserFeedContent: singleFeed),
                                            )
                                            .toList(),
                                      ),
                                      Column(
                                        children: _pollsList
                                            .map(
                                              (poll) => SinglePoll(singlePollContent: poll),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                    // SinglePoll(
                                    //   question: 'Who discovered gravity?',
                                    //   firstAnswer: 'Isaac Newton',
                                    //   secondAnswer: 'Albert Einstein',
                                    //   thirdAnswer: 'Thomas Edison',
                                    //   firstAnswerPercentageFactor: 0.8,
                                    //   secondAnswerPercentageFactor: 0.15,
                                    //   thirdAnswerPercentageFactor: 0.05,
                                    // ),
                                  ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
