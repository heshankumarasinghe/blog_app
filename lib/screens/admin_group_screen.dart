import 'package:blog_app/widgets/center_widget.dart';
import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';
import '../widgets/admin_action_button.dart';
import '../widgets/main_feed_content.dart';
import '../widgets/single_poll.dart';
import '../constants/routes.dart';

class AdminGroupScreen extends StatelessWidget with ResponsiveLayoutMixin {
  const AdminGroupScreen({Key? key}) : super(key: key);

  void _onAddPostPress(BuildContext context) => Navigator.of(context).pushNamed(Routes.toAddPostScreen);
  void _onAddPollPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.toAddPollScreen);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Admin Group'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            width: contentWidth,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
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
                    child: Column(
                      children: const [
                        MainFeedContent(
                          feedImageUrl: 'https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014__340.jpg',
                          feedDescription:
                              'This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!',
                          likesCount: 5,
                        ),
                        MainFeedContent(
                          feedImageUrl: 'https://picsum.photos/200',
                          feedDescription:
                              'This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!',
                          likesCount: 5,
                        ),
                        SinglePoll(
                          question: 'What color is the sky?',
                          firstAnswer: 'Blue',
                          secondAnswer: 'Red',
                          thirdAnswer: 'Green',
                          firstAnswerPercentageFactor: 0.9,
                          secondAnswerPercentageFactor: 0.02,
                          thirdAnswerPercentageFactor: 0.08,
                        ),
                        MainFeedContent(
                          feedImageUrl: 'https://picsum.photos/300',
                          feedDescription:
                              'This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!This is my feed!',
                          likesCount: 5,
                        ),
                        SinglePoll(
                          question: 'Who discovered gravity?',
                          firstAnswer: 'Isaac Newton',
                          secondAnswer: 'Albert Einstein',
                          thirdAnswer: 'Thomas Edison',
                          firstAnswerPercentageFactor: 0.8,
                          secondAnswerPercentageFactor: 0.15,
                          thirdAnswerPercentageFactor: 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
