import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scheduling_appointments_app/widgets/schedule/times_list_widget.dart';
import 'package:scheduling_appointments_app/widgets/screen_section.dart';

class NextTurnDayWidget extends StatelessWidget {
  const NextTurnDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSection(title: "Quick Schedule", child: const TimeListWidget());
  }
}