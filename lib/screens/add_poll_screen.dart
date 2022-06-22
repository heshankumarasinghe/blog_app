import 'package:flutter/material.dart';

import '../constants/constraints.dart';
import '../constants/api_endpoints.dart';
import '../constants/app_constants.dart';
import '../constants/routes.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../utils/alert_util.dart';
import '../utils/toast_util.dart';
import '../services/api_service.dart';

class AddPollScreen extends StatefulWidget {
  const AddPollScreen({Key? key}) : super(key: key);

  @override
  State<AddPollScreen> createState() => _AddPollScreenState();
}

class _AddPollScreenState extends State<AddPollScreen> with ResponsiveLayoutMixin {
  final _pollTitleController = TextEditingController();
  final _firstAnswerController = TextEditingController();
  final _secondAnswerController = TextEditingController();
  final _thirdAnswerController = TextEditingController();

  String? _pollTitleErrorText;
  String? _firstAnswerErrorText;
  String? _secondAnswerErrorText;
  String? _thirdAnswerErrorText;

  void _onPublishPollPressed(BuildContext context) {
    _pollTitleErrorText = null;
    _firstAnswerErrorText = null;
    _secondAnswerErrorText = null;
    _thirdAnswerErrorText = null;

    final pollTitle = _pollTitleController.text.trim();
    final firstAnswer = _firstAnswerController.text.trim();
    final secondAnswer = _secondAnswerController.text.trim();
    final thirdAnswer = _thirdAnswerController.text.trim();

    if (pollTitle.isEmpty) _pollTitleErrorText = 'Poll Title can not be empty';
    if (firstAnswer.isEmpty) _firstAnswerErrorText = 'Answer A can not be empty';
    if (secondAnswer.isEmpty) _secondAnswerErrorText = 'Answer B can not be empty';
    if (thirdAnswer.isEmpty) _thirdAnswerErrorText = 'Answer C can not be empty';

    if (_pollTitleErrorText != null || _firstAnswerErrorText != null || _secondAnswerErrorText != null) {
      return setState(() {});
    }

    AlertUtil.showLoadingAlert(context);

    ApiService.callApi(
      ApiEndpoints.addPoll,
      RequestType.post,
      requestBody: {
        'pollTitle': pollTitle,
        'answers': '[$firstAnswer, $secondAnswer, $thirdAnswer]',
        'groupId': AppConstants.authUser!.groupIds![0].toString(),
      },
      onSuccess: (response) {
        Navigator.of(context).pop();
        ToastUtil.showToast(
          msg: 'Poll Created Successfully!',
          integrity: ToastIntegrity.success,
        );

        _pollTitleController.clear();
        _firstAnswerController.clear();
        _secondAnswerController.clear();
        _thirdAnswerController.clear();

        Navigator.of(context).pushNamedAndRemoveUntil(Routes.toAdminGroupScreen, (route) => false, arguments: {
          'groupId': AppConstants.authUser!.groupIds![0],
        });
      },
      onFailed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Poll'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            width: contentWidth,
            child: Column(
              children: [
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CenterWidget(
                  widget: Text(
                    'Add Poll',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Poll Title',
                  errorText: _pollTitleErrorText,
                  controller: _pollTitleController,
                  onChanged: (_) => setState(() => _pollTitleErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Answer A',
                  errorText: _firstAnswerErrorText,
                  controller: _firstAnswerController,
                  onChanged: (_) => setState(() => _firstAnswerErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Answer B',
                  errorText: _secondAnswerErrorText,
                  controller: _secondAnswerController,
                  onChanged: (_) => setState(() => _secondAnswerErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Answer C',
                  errorText: _thirdAnswerErrorText,
                  controller: _thirdAnswerController,
                  onChanged: (_) => setState(() => _thirdAnswerErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
                CustomElevatedButton(
                  buttonText: 'Publish Poll',
                  onPressed: () => _onPublishPollPressed(context),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
