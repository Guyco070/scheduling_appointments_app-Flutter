import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';

class ScreenSection extends StatelessWidget {
  const ScreenSection({super.key,required this.title, required this.child,});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Config.spaceSmall,
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
          child: child,
        ),
      ],
    );
  }
}