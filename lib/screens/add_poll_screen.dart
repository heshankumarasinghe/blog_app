import 'package:flutter/material.dart';

import '../constants/constraints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_elevated_button.dart';

class AddPollScreen extends StatelessWidget with ResponsiveLayoutMixin {
  const AddPollScreen({Key? key}) : super(key: key);

  void _onPublishPollPressed(BuildContext context) {}

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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Poll Title',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Answer A',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Answer B',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Answer C',
                  ),
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
