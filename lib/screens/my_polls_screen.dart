import 'package:flutter/material.dart';

import '../constants/api_endpoints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/single_poll.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../services/api_service.dart';
import '../models/single_poll_content.dart';

class MyPollsScreen extends StatefulWidget {
  const MyPollsScreen({Key? key}) : super(key: key);

  @override
  State<MyPollsScreen> createState() => _MyPollsScreenState();
}

class _MyPollsScreenState extends State<MyPollsScreen> with ResponsiveLayoutMixin {
  late bool _isLoading;

  List<SinglePollContent> _pollContent = [];

  void _onPollFetchingComplete(dynamic response) {
    _isLoading = false;

    final pollData = response['data']['pool_data'];

    pollData.forEach((poll) {
      _pollContent.add(SinglePollContent.fromJson(poll));
    });

    setState(() {});
  }

  void _fetchPollResults() {
    ApiService.callApi(
      ApiEndpoints.fetchPollResults,
      RequestType.post,
      requestBody: {},
      onSuccess: _onPollFetchingComplete,
      onFailed: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchPollResults();
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);
    final contentHeight = getContentHeight(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Polls'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            height: contentHeight,
            child: _isLoading
                ? const Center(
                    child: CustomCircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: _pollContent
                                .map(
                                  (poll) => SinglePoll(
                                    singlePollContent: poll,
                                  ),
                                )
                                .toList(),
                            // children: const [
                            // SinglePoll(
                            //   question: 'How many times can you subtract 5 from 25?',
                            //   firstAnswer: 'Once',
                            //   secondAnswer: 'Twice',
                            //   thirdAnswer: 'Thrice',
                            //   firstAnswerPercentageFactor: 0.6,
                            //   secondAnswerPercentageFactor: 0.3,
                            //   thirdAnswerPercentageFactor: 0.1,
                            // ),
                            // SinglePoll(
                            //   question: 'Who discovered gravity?',
                            //   firstAnswer: 'Isaac Newton',
                            //   secondAnswer: 'Albert Einstein',
                            //   thirdAnswer: 'Thomas Edison',
                            //   firstAnswerPercentageFactor: 0.8,
                            //   secondAnswerPercentageFactor: 0.15,
                            //   thirdAnswerPercentageFactor: 0.05,
                            // ),
                            // SinglePoll(
                            //   question: 'What color is the sky?',
                            //   firstAnswer: 'Blue',
                            //   secondAnswer: 'Red',
                            //   thirdAnswer: 'Green',
                            //   firstAnswerPercentageFactor: 0.9,
                            //   secondAnswerPercentageFactor: 0.02,
                            //   thirdAnswerPercentageFactor: 0.08,
                            // ),
                            // ],
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
