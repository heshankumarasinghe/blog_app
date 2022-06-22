import 'package:blog_app/constants/api_endpoints.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/single_pole_answer.dart';
import '../models/single_poll_content.dart';
import '../utils/toast_util.dart';
import '../utils/alert_util.dart';
import '../services/api_service.dart';

enum PollOption { A, B, C }

extension PollOptionExtension on PollOption {
  String get value {
    switch (this) {
      case PollOption.A:
        return 'A';

      case PollOption.B:
        return 'B';

      case PollOption.C:
        return 'C';
    }
  }

  Map<String, String> getRequestBodyForOption(int pollId) {
    switch (this) {
      case PollOption.A:
        return {
          'pollid': pollId.toString(),
          'answer1poll': '1',
          'answer2poll': '0',
          'answer3poll': '0',
        };

      case PollOption.B:
        return {
          'pollid': pollId.toString(),
          'answer1poll': '0',
          'answer2poll': '1',
          'answer3poll': '0',
        };

      case PollOption.C:
        return {
          'pollid': pollId.toString(),
          'answer1poll': '0',
          'answer2poll': '0',
          'answer3poll': '1',
        };
    }
  }
}

class SinglePoll extends StatelessWidget with ResponsiveLayoutMixin {
  final SinglePollContent singlePollContent;

  const SinglePoll({
    required this.singlePollContent,
    Key? key,
  }) : super(key: key);

  void _onPollOptionTap(BuildContext context, PollOption pollOption) {
    AlertUtil.showLoadingAlert(context);

    final requestBody = pollOption.getRequestBodyForOption(singlePollContent.id);

    ApiService.callApi(
      ApiEndpoints.votePoll,
      RequestType.post,
      requestBody: requestBody,
      onSuccess: (response) {
        Navigator.of(context).pop();
        ToastUtil.showToast(
          msg: 'Successfully Recorded Your Vote!',
          integrity: ToastIntegrity.success,
        );
        Navigator.of(context).pushNamedAndRemoveUntil(Routes.toPrimaryFeedScreen, (route) => false);
      },
      onFailed: () {
        Navigator.of(context).pop();
        ToastUtil.showToast(
          msg: 'An Unknown Error Occurred!',
          integrity: ToastIntegrity.success,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return Column(
      children: [
        SizedBox(
          width: contentWidth,
          child: Text(
            singlePollContent.pollTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _onPollOptionTap(context, PollOption.A),
          child: SinglePollAnswer(
            percentageFactor: singlePollContent.firstAnswerCount / 100,
            answer: singlePollContent.pollAnswers[0],
            order: PollOption.A.value,
          ),
        ),
        GestureDetector(
          onTap: () => _onPollOptionTap(context, PollOption.B),
          child: SinglePollAnswer(
            percentageFactor: singlePollContent.secondAnswerCount / 100,
            answer: singlePollContent.pollAnswers[1],
            order: PollOption.B.value,
          ),
        ),
        GestureDetector(
          onTap: () => _onPollOptionTap(context, PollOption.C),
          child: SinglePollAnswer(
            percentageFactor: singlePollContent.thirdAnswerCount / 100,
            answer: singlePollContent.pollAnswers[2],
            order: PollOption.C.value,
          ),
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
