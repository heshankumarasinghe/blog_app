import 'package:flutter/material.dart';

import '../constants/routes.dart';
import '../constants/constraints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_elevated_button.dart';

class AddPostScreen extends StatelessWidget with ResponsiveLayoutMixin {
  const AddPostScreen({Key? key}) : super(key: key);

  void _onPublishPostPressed(BuildContext context) {}

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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Post Name',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Post Image Url',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Post Description',
                  ),
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
