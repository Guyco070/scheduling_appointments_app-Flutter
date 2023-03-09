import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/screens/login_screen.dart';
import 'package:scheduling_appointments_app/widgets/form_text_field.dart';
import 'package:scheduling_appointments_app/widgets/logo.dart';
import 'package:scheduling_appointments_app/widgets/screen_topic.dart';
import 'package:scheduling_appointments_app/widgets/span_button.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? confirmPassword;
  String? email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: ProgressHUD(
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(key: globalFormKey, child: _registerUI(context)),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    bool isPC = password != null &&
                  confirmPassword != null &&
                  password!.length >= 8 &&
                  password == confirmPassword;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Logo('assets/images/app_logo.jpg'),
          ScreenTopic('Register'),
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
          FormTextField("password", "Password", (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Password can't be empty";
                } else if ((onValidateVal as String).length < 8) {
                  return "Password length must be 8 letters or more";
                }
                return null;
              }, (onSavedVal) {
                password = onSavedVal;
              },
              onChange: (val) {
                setState(() {
                  password = val.toString();
                });
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
                  ))),
          FormTextField("confirmPassword", "Confirm password", (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Password can't be empty";
                } else if ((onValidateVal as String).length < 8) {
                  return "Password length must be 8 letters or more";
                } else if (onValidateVal != password) {
                  return "Password length must be 8 letters or more";
                } else if (confirmPassword != password) {
                  return "Password confirmation field does not match password field";
                }
                return null;
              }, 
              (onSavedVal) {
                confirmPassword = onSavedVal;
              }, 
              onChange: (val) {
                setState(() {
                  confirmPassword = val.toString();
                });
              },
              prefixIcon: Icons.password_outlined,
              obscureText: hidePassword,
              suffixIcon: Icon(
                color: isPC ? Colors.green.withOpacity(0.7) : Colors.red.withOpacity(0.7),
                isPC ? Icons.check : Icons.close,
            )
          ),
          FormTextField(
            "email",
            "Email",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email can't be empty";
              } else if (!(onValidateVal as String).contains("@") ||
                  !(onValidateVal as String).contains(".")) {
                return "The email address is not valid";
              }
              return null;
            },
            (onSavedVal) {
              email = onSavedVal;
            },
            prefixIcon: Icons.email_outlined,
          ),
          Center(
            child: FormHelper.submitButton(
              "Register",
              () {},
              btnColor: Theme.of(context).colorScheme.primary,
              txtColor: Colors.white,
              borderColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SpanButton(
            text: "Already have an acount? ",
            buttonText: "Login",
            onTap: () => Navigator.of(context).pushNamed(LoginScreen.routeName),
          ),
        ],
      ),
    );
  }
}
