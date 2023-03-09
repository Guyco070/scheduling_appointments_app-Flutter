import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/screens/register_screen.dart';
import 'package:scheduling_appointments_app/widgets/form_text_field.dart';
import 'package:scheduling_appointments_app/widgets/logo.dart';
import 'package:scheduling_appointments_app/widgets/screen_topic.dart';
import 'package:scheduling_appointments_app/widgets/span_button.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

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
          ScreenTopic('Login'),
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
          SpanButton(
            alignment: Alignment.bottomRight,
            buttonText: "Forget Password ?",
            onTap: () => print('Forget Password'),
          ),
          const SizedBox(height: 20,),
          Center(
            child: FormHelper.submitButton(
              "Login", 
              () {},
              btnColor: Theme.of(context).colorScheme.primary,
              txtColor: Colors.white,
              borderColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(height: 20,),
          SpanButton(
            text: "Don't have an acount? ",
            buttonText: "Sign up",
            onTap: () => Navigator.of(context).pushNamed(RegisterScreen.routeName),
          ),
        ],
      ),
    );
  }
}
