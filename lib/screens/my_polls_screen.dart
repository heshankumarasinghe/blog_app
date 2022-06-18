import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/single_poll.dart';

class MyPollsScreen extends StatelessWidget with ResponsiveLayoutMixin {
  const MyPollsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Polls'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        SinglePoll(
                          question: 'How many times can you subtract 5 from 25?',
                          firstAnswer: 'Once',
                          secondAnswer: 'Twice',
                          thirdAnswer: 'Thrice',
                          firstAnswerPercentageFactor: 0.6,
                          secondAnswerPercentageFactor: 0.3,
                          thirdAnswerPercentageFactor: 0.1,
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
                        SinglePoll(
                          question: 'What color is the sky?',
                          firstAnswer: 'Blue',
                          secondAnswer: 'Red',
                          thirdAnswer: 'Green',
                          firstAnswerPercentageFactor: 0.9,
                          secondAnswerPercentageFactor: 0.02,
                          thirdAnswerPercentageFactor: 0.08,
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
