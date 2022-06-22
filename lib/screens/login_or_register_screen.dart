import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_constants.dart';
import '../constants/api_endpoints.dart';
import '../constants/routes.dart';
import '../constants/constraints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/center_widget.dart';
import '../widgets/custom_link.dart';
import '../widgets/custom_text_field.dart';
import '../services/api_service.dart';
import '../utils/toast_util.dart';
import '../models/auth_user.dart';

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

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _nameErrorText;
  String? _usernameErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

  void _onLoginOrRegisterPressed() {
    _nameErrorText = null;
    _usernameErrorText = null;
    _passwordErrorText = null;
    _confirmPasswordErrorText = null;

    final _name = _nameController.text.trim();
    final _username = _usernameController.text.trim();
    final _password = _passwordController.text.trim();
    final _confirmPassword = _confirmPasswordController.text.trim();

    if (_username.isEmpty) _usernameErrorText = 'Username can not be empty';
    if (_password.isEmpty) _passwordErrorText = 'Password can not be empty';
    if (_authState == AuthState.register && _name.isEmpty) _nameErrorText = 'Name can not be empty';
    if (_authState == AuthState.register && _confirmPassword.isEmpty) {
      _confirmPasswordErrorText = 'Confirm Password can no be empty';
    }
    if (_authState == AuthState.register && _password != _confirmPassword) {
      _confirmPasswordErrorText = 'Password and Confirm Password has to match';
    }

    if (_usernameErrorText != null || _passwordErrorText != null) return setState(() {});
    if (_authState == AuthState.register && (_nameErrorText != null || _confirmPasswordErrorText != null)) {
      return setState(() {});
    }

    ApiService.callApi(
      _authState == AuthState.login ? ApiEndpoints.login : ApiEndpoints.register,
      RequestType.post,
      requestBody: {
        'name': _name,
        'username': _username,
        'password': _password,
        'is_admin': '0',
      },
      onSuccess: (response) {
        final String responseMessage = response['message'].toLowerCase();

        String? errorMessage;

        if (responseMessage == "login user successful" || responseMessage == "create user successful") {
          final userData = response['data'];
          final authUser = AuthUser.fromJson(userData);

          AppConstants.authUser = authUser;

          if (_authState == AuthState.login) {
            if (authUser.isAdmin) {
              return Navigator.of(context).pushNamed(Routes.toAdminGroupScreen, arguments: {
                'groupId': authUser.groupIds![0],
              });
            }
            return Navigator.of(context).pushNamed(Routes.toPrimaryFeedScreen);
          } else {
            return Navigator.of(context).pushNamed(Routes.toPrimaryFeedScreen);
          }
        } else if (responseMessage == "user with given username already exists") {
          errorMessage = 'User already exists';
        } else if (responseMessage == "user doesn't exist" || responseMessage == "invalid password") {
          errorMessage = 'Invalid Username or Password';
        } else {
          errorMessage = 'Unknown Error Occurred';
        }

        return ToastUtil.showToast(
          msg: errorMessage.toString(),
          integrity: ToastIntegrity.danger,
        );
      },
      onFailed: () {
        ToastUtil.showToast(
          msg: 'An Unknown Error Occurred',
          integrity: ToastIntegrity.danger,
        );
      },
    );
  }

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
                  CustomTextField(
                    labelText: 'Name',
                    errorText: _nameErrorText,
                    controller: _nameController,
                    onChanged: (_) => setState(() => _passwordErrorText = null),
                  ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Username',
                  errorText: _usernameErrorText,
                  controller: _usernameController,
                  onChanged: (_) => setState(() => _usernameErrorText = null),
                ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFields,
                ),
                CustomTextField(
                  labelText: 'Password',
                  errorText: _passwordErrorText,
                  controller: _passwordController,
                  onChanged: (_) => setState(() => _passwordErrorText = null),
                ),
                if (_authState == AuthState.register)
                  const SizedBox(
                    height: Constraints.gapBetweenTextFields,
                  ),
                if (_authState == AuthState.register)
                  CustomTextField(
                    labelText: 'Confirm Password',
                    errorText: _confirmPasswordErrorText,
                    controller: _confirmPasswordController,
                    onChanged: (_) => setState(() => _confirmPasswordErrorText = null),
                  ),
                const SizedBox(
                  height: Constraints.gapBetweenTextFieldAndBottomButton,
                ),
                CustomElevatedButton(
                  buttonText: _authState.value,
                  onPressed: _onLoginOrRegisterPressed,
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
