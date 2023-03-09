import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scheduling_appointments_app/widgets/form_text_field.dart';
import 'package:scheduling_appointments_app/widgets/logo.dart';
import 'package:scheduling_appointments_app/widgets/screen_topic.dart';
import 'package:scheduling_appointments_app/widgets/span_button.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

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
          // FormHelper.inputFieldWidget(context, "userName", "UserName",
          //     (onValidateVal) {
          //   if (onValidateVal.isEmpty) {
          //     return "Username can't be empty";
          //   }
          //   return null;
          // }, (onSavedVal) {
          //   userName = onSavedVal;
          // },
          //     prefixIcon: const Icon(Icons.person),
          //     showPrefixIcon: true,
          //     prefixIconColor: Colors.white,
          //     borderColor: Colors.white,
          //     borderFocusColor: Colors.white,
          //     textColor: Colors.white,
          //     hintColor: Colors.white.withOpacity(0.7),
          //     borderRadius: 10),
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
          // Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: FormHelper.inputFieldWidget(context, "password", "Password",
          //       (onValidateVal) {
          //     if (onValidateVal.isEmpty) {
          //       return "Password can't be empty";
          //     } else if ((onValidateVal as String).length < 8) {
          //       return "Password length must be 8 letters or more";
          //     }
          //     return null;
          //   }, 
          //   (onSavedVal) {
          //     password = onSavedVal;
          //   },
          //   prefixIcon: const Icon(Icons.password_outlined),
          //   showPrefixIcon: true,
          //   prefixIconColor: Colors.white,
          //   borderColor: Colors.white,
          //   textColor: Colors.white,
          //   hintColor: Colors.white.withOpacity(0.7),
          //   borderFocusColor: Colors.white,
          //   borderRadius: 10,
          //   obscureText: hidePassword,
          //   suffixIcon: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           hidePassword = !hidePassword;
          //         });
          //       },
          //       color: Colors.white.withOpacity(0.7),
          //       icon: Icon(
          //         hidePassword ? Icons.visibility_off : Icons.visibility,
          //   ))
          //   ),
          // ),
          SpanButton(
            alignment: Alignment.bottomRight,
            buttonText: "Forget Password ?",
            onTap: () => print('Forget Password'),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 25, top: 10),
          //     child: RichText(
          //       text:  TextSpan(
          //       style: const TextStyle(
          //           color: Colors.grey,
          //           fontSize: 14.0,
          //         ),
          //         children: <TextSpan>[
          //           TextSpan(
          //             text: "Forget Password ?",
          //             style: const TextStyle(
          //               color: Colors.white,
          //               decoration: TextDecoration.underline,
          //             ),
          //             recognizer: TapGestureRecognizer()..onTap =() => print('Forget Password')
          //           )
          //         ]
          //       ),
          //     ),
          //   ),
          // ),
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
            onTap: () => print('Sign up'),
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 25, top: 10),
          //     child: RichText(
          //       text:  TextSpan(
          //       style: const TextStyle(
          //           color: Colors.grey,
          //           fontSize: 14.0,
          //         ),
          //         children: <TextSpan>[
          //           const TextSpan(text: "Don't have an acount? "),
          //           TextSpan(
          //             text: "Sign up",
          //             style: const TextStyle(
          //               color: Colors.white,
          //               decoration: TextDecoration.underline,
          //             ),
          //             recognizer: TapGestureRecognizer()..onTap =() => print('Sign up')
          //           )
          //         ]
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
