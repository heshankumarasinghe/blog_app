import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

enum ToastIntegrity { danger, success }

extension IntegrityColor on ToastIntegrity {
  Color get color {
    switch (this) {
      case ToastIntegrity.success:
        return Colors.green;

      case ToastIntegrity.danger:
        return Colors.red;
    }
  }
}

class ToastUtil {
  ToastUtil._();

  static Future<bool?> showToast({
    required String msg,
    required ToastIntegrity integrity,
  }) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: integrity.color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
