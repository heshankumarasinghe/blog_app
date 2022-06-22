import 'package:flutter/material.dart';

class NoPreviewAvailableContainer extends StatelessWidget {
  const NoPreviewAvailableContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: const Center(
        child: Text(
          'No Preview Available',
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
