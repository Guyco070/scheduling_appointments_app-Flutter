import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/my_work/work_image_widget.dart';

class ScreenSection extends StatelessWidget {
  ScreenSection({super.key,required this.title, required this.child,});

  String title;
  Widget child;

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