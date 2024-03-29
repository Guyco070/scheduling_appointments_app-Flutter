import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/widgets/schedule/times_list_widget.dart';
import 'package:scheduling_appointments_app/widgets/screen_section.dart';

class NextTurnDayWidget extends StatelessWidget {
  const NextTurnDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenSection(title: "Quick Schedule", child: TimeListWidget());
  }
}