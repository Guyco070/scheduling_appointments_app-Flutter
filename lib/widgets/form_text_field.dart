import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField(
    this.keyName,
    this.labelText,
    this.hintText,
    this.onValidate,
    this.onSaved, {
    super.key,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.onChange,
    this.keyboardType,
  });

  final String keyName;
  final String labelText;
  final String hintText;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final IconData? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  final double borderRadius = 12;

  Color getColor(Color primaryColor) => primaryColor == Colors.white ? primaryColor : Colors.white; 

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final textColor = getColor(color);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextFormField(
        // controller,
        keyboardType: keyboardType,
        onChanged: onChange,
        onSaved: onSaved,
        validator: onValidate,
        obscureText: obscureText,
        cursorColor: textColor,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          floatingLabelStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500
          ),
          // disabled hint style
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500
          ),
          // enabled hint style
          hintStyle: TextStyle(
            color: textColor.withOpacity(0.7),
          ),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
          ),
          alignLabelWithHint: true,
          prefixIcon: Icon(
            prefixIcon,
            color: textColor,
          ),
          suffixIcon: suffixIcon,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
          focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
          errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
          focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
      ),
        ),
    );
  }
}