import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scheduling_appointments_app/utils/config.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget(this.timeText ,{super.key,});
  String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
        )
      ),
      child: Text(
        timeText,
        style: TextStyle(
          color: Config.onLogoIconColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}