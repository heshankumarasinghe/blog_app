import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/routes.dart';
import '../constants/api_endpoints.dart';
import '../constants/constraints.dart';
import '../constants/app_constants.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/custom_text_field.dart';
import '../utils/alert_util.dart';
import '../utils/toast_util.dart';
import '../services/api_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> with ResponsiveLayoutMixin {
  final _postNameController = TextEditingController();
  final _postImageController = TextEditingController();
  final _postDescriptionController = TextEditingController();

  String? _postNameErrorText;
  String? _postImageErrorText;
  String? _postDescriptionErrorText;

  void _onPublishPostPressed(BuildContext context) {
    _postNameErrorText = null;
    _postImageErrorText = null;
    _postDescriptionErrorText = null;

    final postName = _postNameController.text.trim();
    final postImage = _postImageController.text.trim();
    final postDescription = _postDescriptionController.text.trim();

    if (postName.isEmpty) _postNameErrorText = 'Post Name can not be empty';
    if (postImage.isEmpty) _postImageErrorText = 'Post Image can not be empty';
    if (postDescription.isEmpty) _postDescriptionErrorText = 'Post Description can not be empty';

    if (_postNameErrorText != null || _postImageErrorText != null || _postDescriptionErrorText != null) {
      return setState(() {});
    }

    AlertUtil.showLoadingAlert(context);

    ApiService.callApi(
      ApiEndpoints.addPost,
      RequestType.post,
      requestBody: {
        'postTitle': postName,
        'postDescription': postDescription,
        'postImage': postImage,
        'groupId': AppConstants.authUser!.groupIds![0].toString(),
      },
      onSuccess: (response) {
        Navigator.of(context).pop();
        ToastUtil.showToast(
          msg: 'Post Created Successfully!',
          integrity: ToastIntegrity.success,
        );

        _postNameController.clear();
        _postImageController.clear();
        _postDescriptionController.clear();

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
          title: const Text('Add Post'),
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
                    'Add Post',
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
                  labelText: 'Post Name',
                  errorText: _postNameErrorText,
                  controller: _postNameController,
                  onChanged: (_) => setState(() => _postNameErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Post Image Url',
                  errorText: _postImageErrorText,
                  controller: _postImageController,
                  onChanged: (_) => setState(() => _postImageErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Post Description',
                  errorText: _postDescriptionErrorText,
                  controller: _postDescriptionController,
                  maxLines: 5,
                  onChanged: (_) => setState(() => _postDescriptionErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
                CustomElevatedButton(
                  buttonText: 'Publish Post',
                  onPressed: () => _onPublishPostPressed(context),
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
