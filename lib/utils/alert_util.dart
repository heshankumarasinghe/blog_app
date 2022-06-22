import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widgets/custom_circular_progress_indicator.dart';

enum ButtonType { none, okAndCancel }

class AlertUtil {
  AlertUtil._();

  static Future<bool?> showAlert(
    BuildContext context, {
    required Widget content,
    AlertType alertType = AlertType.info,
    ButtonType buttonType = ButtonType.okAndCancel,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) {
    return Alert(
      context: context,
      type: alertType,
      content: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          content,
        ],
      ),
      buttons: buttonType == ButtonType.okAndCancel
          ? [
              DialogButton(
                child: const Text('Yes'),
                color: Theme.of(context).colorScheme.primary,
                onPressed: onOk,
              ),
              DialogButton(
                child: const Text('No'),
                color: Theme.of(context).colorScheme.primary,
                onPressed: onCancel ?? () => Navigator.of(context).pop(),
              )
            ]
          : [],
    ).show();
  }

  static Future<bool?> showLoadingAlert(BuildContext context) {
    return AlertUtil.showAlert(
      context,
      alertType: AlertType.none,
      content: Column(
        children: const [
          Center(
            child: CustomCircularProgressIndicator(),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Please Wait...',
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
      buttonType: ButtonType.none,
    );
  }
}
