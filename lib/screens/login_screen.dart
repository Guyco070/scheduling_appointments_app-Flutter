import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/widgets/register_screen.dart';
import 'package:scheduling_appointments_app/widgets/animated/expanded_section.dart';
import 'package:scheduling_appointments_app/widgets/form_text_field.dart';
import 'package:scheduling_appointments_app/widgets/logo.dart';
import 'package:scheduling_appointments_app/widgets/screen_topic.dart';
import 'package:scheduling_appointments_app/widgets/span_button.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

enum AuthMode { signup, login }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  AuthMode _authMode = AuthMode.login;
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: ProgressHUD(
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(key: globalFormKey, child: _loginUI(context)),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Logo('assets/images/app_logo.jpg'),
          ScreenTopic(_authMode == AuthMode.login ? 'Login' : 'Sign up'),
          FormTextField(
            "userName", 
            "UserName",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username can't be empty";
              }
              return null;
            },
            (onSavedVal) {
              userName = onSavedVal;
            },
            prefixIcon: Icons.person,
          ),
          FormTextField(
            "password", "Password",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Password can't be empty";
              } else if ((onValidateVal as String).length < 8) {
                return "Password length must be 8 letters or more";
              }
              return null;
            }, 
            (onSavedVal) {
              password = onSavedVal;
            },
            prefixIcon: Icons.password_outlined,
            obscureText: hidePassword,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
            ))
          ),
          ExpandedSection(
            expand: _authMode == AuthMode.signup,
            child: const RegisterWidget()
          ),
          SpanButton(
            alignment: Alignment.bottomRight,
            buttonText: "Forgot Password ?",
            onTap: () => print('Forgot Password'),
          ),
          const SizedBox(height: 20,),
          Center(
            child: FormHelper.submitButton(
              _authMode == AuthMode.login
               ? "Login"
               : "Register", 
              _authMode == AuthMode.login
              ? () {
                globalFormKey.currentState!.validate();
                // Navigator.of(context).pushNamed("user_home_page");
              }
              : () {
                globalFormKey.currentState!.validate();
              },
              btnColor: Theme.of(context).colorScheme.primary,
              txtColor: Colors.white,
              borderColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(height: 20,),
          SpanButton(
            text: '${_authMode == AuthMode.login ? "Don't " : "Already"} have an acount? ',
            buttonText: _authMode == AuthMode.login ? "Sign up" : "Login",
            onTap: _switchAuthMode,
          ),
        ],
      ),
    );
  }
}
