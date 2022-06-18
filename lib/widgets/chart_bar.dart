import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double percentageFactor;

  const ChartBar({
    Key? key,
    required this.percentageFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          const SizedBox(
            height: 4.5,
          ),
          Text(
            '${percentageFactor * 100}%',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
