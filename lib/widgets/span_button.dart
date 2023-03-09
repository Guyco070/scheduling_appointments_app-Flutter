import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SpanButton extends StatelessWidget {
  SpanButton(
      {super.key,
      this.alignment = Alignment.center,
      this.text,
      this.buttonText,
      this.onTap
      });
  String? buttonText;
  String? text;
  Alignment alignment;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(right: 25, top: 10),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                TextSpan(text: text),
                TextSpan(
                    text: buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = onTap)
              ]),
        ),
      ),
    );
  }
}
