import 'package:flutter/material.dart';

import '../mixins/responsive_layout_mixin.dart';
import '../widgets/chart_bar.dart';

class SinglePollAnswer extends StatelessWidget with ResponsiveLayoutMixin {
  final String order;
  final String answer;
  final double percentageFactor;

  const SinglePollAnswer({
    Key? key,
    required this.order,
    required this.answer,
    required this.percentageFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: contentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$order) $answer',
                textAlign: TextAlign.left,
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
          height: 15,
        ),
        SizedBox(
          width: contentWidth,
          child: Stack(
            children: [
              Container(
                width: contentWidth * percentageFactor,
                height: 30,
                color: Colors.lightBlueAccent,
              ),
              Container(
                width: contentWidth,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2.5,
                  ),
                ),
              ),
              ChartBar(
                percentageFactor: percentageFactor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
