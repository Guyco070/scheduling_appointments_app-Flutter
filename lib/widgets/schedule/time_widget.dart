import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget(this.timeText ,{super.key, required this.isChosen, required this.setChosenTime});
  final String timeText;
  final bool isChosen;
  final Function setChosenTime;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.setChosenTime(widget.timeText),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.isChosen ? Theme.of(context).colorScheme.primary : Config.onLogoIconColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )
        ),
        child: Text(
          widget.timeText,
          style: TextStyle(
            color: widget.isChosen ? Config.onLogoIconColor : Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}