import 'package:flutter/material.dart';

class ScreenTopic extends StatelessWidget {
  const ScreenTopic(this.text, {super.key});
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 50, bottom: 30),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
