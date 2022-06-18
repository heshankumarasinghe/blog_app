import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/routes.dart';
import '../constants/constraints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_link.dart';

enum AuthState { login, register }

extension AuthStateExtension on AuthState {
  String get value {
    switch (this) {
      case AuthState.login:
        return 'Login';

      case AuthState.register:
        return 'Register';
    }
  }

  static AuthState switchState(AuthState authState) {
    if (authState == AuthState.login) {
      return AuthState.register;
    } else {
      return AuthState.login;
    }
  }
}

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> with ResponsiveLayoutMixin {
  AuthState _authState = AuthState.login;

  void _onLoginPressed() => Navigator.of(context).pushNamed(Routes.toPrimaryFeedScreen);

  void _onRegisterPressed() => Navigator.of(context).pushNamed(Routes.toPrimaryFeedScreen);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_authState.value),
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
                    'Welcome to Club Manager',
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
                if (_authState == AuthState.register)
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                if (_authState == AuthState.register)
                  const SizedBox(
                    height: Constraints.gapBetweenTextFields,
                  ),
                if (_authState == AuthState.register)
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
                CustomElevatedButton(
                  buttonText: _authState.value,
                  onPressed: _authState == AuthState.login ? _onLoginPressed : _onRegisterPressed,
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
                CustomLink(
                  text: '${AuthStateExtension.switchState(_authState).value} Instead',
                  icon: _authState == AuthState.login ? FontAwesomeIcons.userPlus : FontAwesomeIcons.user,
                  onTap: () => setState(() => _authState = AuthStateExtension.switchState(_authState)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
