import 'package:flutter/material.dart';

class ErrorRouteScreen extends StatelessWidget {
  const ErrorRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'A screen can not be matched for this route',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
