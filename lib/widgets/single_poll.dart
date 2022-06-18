import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';
import '../widgets/single_pole_answer.dart';

class SinglePoll extends StatelessWidget with ResponsiveLayoutMixin {
  final String question;
  final String firstAnswer;
  final String secondAnswer;
  final String thirdAnswer;
  final double firstAnswerPercentageFactor;
  final double secondAnswerPercentageFactor;
  final double thirdAnswerPercentageFactor;

  const SinglePoll({
    Key? key,
    required this.question,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.firstAnswerPercentageFactor,
    required this.secondAnswerPercentageFactor,
    required this.thirdAnswerPercentageFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return Column(
      children: [
        SizedBox(
          width: contentWidth,
          child: Text(
            question,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        SinglePollAnswer(
          percentageFactor: firstAnswerPercentageFactor,
          answer: firstAnswer,
          order: 'A',
        ),
        SinglePollAnswer(
          percentageFactor: secondAnswerPercentageFactor,
          answer: secondAnswer,
          order: 'B',
        ),
        SinglePollAnswer(
          percentageFactor: thirdAnswerPercentageFactor,
          answer: thirdAnswer,
          order: 'C',
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: contentWidth,
          child: const Divider(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
