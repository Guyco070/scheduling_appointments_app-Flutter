import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FormTextField extends StatelessWidget {
  FormTextField(
    this.keyName,
    this.hintText,
    this.onValidate,
    this.onSaved, {
    super.key,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  String keyName;
  String hintText;
  Function onValidate;
  Function onSaved;
  IconData? prefixIcon;
  bool obscureText;
  Widget? suffixIcon;

  bool get isPrefixIcon => prefixIcon != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FormHelper.inputFieldWidget(
          context, keyName, hintText, onValidate, onSaved,
          prefixIcon: Icon(prefixIcon),
          showPrefixIcon: isPrefixIcon,
          prefixIconColor: Colors.white,
          borderColor: Colors.white,
          borderFocusColor: Colors.white,
          textColor: Colors.white,
          hintColor: Colors.white.withOpacity(0.7),
          borderRadius: 10,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
        )
    );
  }
}
