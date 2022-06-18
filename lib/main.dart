import 'package:blog_app/screens/login_or_register_screen.dart';
import 'package:flutter/material.dart';

import './constants/styles/common_colors.dart';
import './constants/styles/border_styles.dart';
import './constants/routes.dart';
import './routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return MaterialApp(
      title: 'EKYC',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.deepPurpleAccent,
          // primaryContainer: CommonColors.primaryDarkColor,
          // onPrimary: Colors.white,
          secondary: Colors.purpleAccent,
          // secondaryContainer: CommonColors.secondaryDarkColor,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 38,
            color: CommonColors.secondaryLightColor,
            fontWeight: FontWeight.w400,
          ),
          headline2: TextStyle(
            fontSize: 28,
            color: CommonColors.secondaryColor,
          ),
          headline3: TextStyle(
            fontSize: 18,
            color: CommonColors.secondaryColor,
          ),
          headline4: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
            color: CommonColors.secondaryColor,
          ),
          headline5: TextStyle(
            fontSize: 15.5,
            color: CommonColors.secondaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurpleAccent,
            onPrimary: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: CommonColors.secondaryColor,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: CommonColors.secondaryColor,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderStyles.primaryBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          errorMaxLines: 3,
        ),
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const LoginOrRegisterScreen(),
    );
  }
}
