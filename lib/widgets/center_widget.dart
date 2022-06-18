import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  // This widget is responsible for vertically centering it's child widget. Helpful
  // when we want to vertically center a text in a row.

  final Widget widget;

  const CenterWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [widget],
    );
  }
}
