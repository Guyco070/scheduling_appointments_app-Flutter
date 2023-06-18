import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/widgets/form_text_field.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key, this.hidePassword = true});
  static String routeName = '/register';
  final bool hidePassword;

  @override
  State<RegisterWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterWidget> {
  bool isAPICallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? confirmPassword;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: _registerUI(context),
    );
  }

  Widget _registerUI(BuildContext context) {
    bool isPC = password != null &&
                  confirmPassword != null &&
                  password!.length >= 8 &&
                  password == confirmPassword;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTextField(
          "confirmPassword", 
          "Confirm password", 
          "Confirm password", 
          (onValidateVal) {
              if (onValidateVal != null && onValidateVal.isEmpty) {
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
            keyboardType: TextInputType.visiblePassword,
            onChange: (val) {
              setState(() {
                confirmPassword = val.toString();
              });
            },
            prefixIcon: Icons.password_outlined,
            obscureText: widget.hidePassword,
            suffixIcon: Icon(
              color: isPC ? Colors.green.withOpacity(0.7) : Colors.red.withOpacity(0.7),
              isPC ? Icons.check : Icons.close,
          )
        ),
        FormTextField(
          "email",
          "Email",
          "Enter Email",
          (onValidateVal) {
            if (onValidateVal != null && onValidateVal.isEmpty) {
              return "Email can't be empty";
            } else if (!(onValidateVal as String).contains("@") ||
                !(onValidateVal).contains(".")) {
              return "The email address is not valid";
            }
            return null;
          },
          (onSavedVal) {
            email = onSavedVal;
          },
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
        ),
      ],
    );
  }
}
