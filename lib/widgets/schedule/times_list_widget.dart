import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/schedule/DatePickerWidget.dart';
import 'package:scheduling_appointments_app/widgets/schedule/time_widget.dart';

class TimeListWidget extends StatefulWidget {
  const TimeListWidget({super.key});

  @override
  State<TimeListWidget> createState() => _TimeListWidgetState();
}

class _TimeListWidgetState extends State<TimeListWidget> {
  final List<TimeWidget> timeWidgets = [];
  int toViewIndex = 20;

  getTimeWidgets(){
    for(int i = 9, j = 0; i < 21; j = (j + 15) % 60) {
      String timeText = i.toString();
      timeText = timeText.length == 2 ? timeText : '0$timeText';
      timeText += ':${j.toString().length == 2 ? j.toString() : '00'}';
      timeWidgets.add(TimeWidget(timeText));

      if((j+15) % 60 == 0){
        i++;
      }      
    }
    
    setState(() {
      
    });
  }

  @override
  void initState() {
    getTimeWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("10/05/2023",),
        Config.spaceSmall,
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            ...timeWidgets
          ],
        ),
        DatePickerWidget(),
      ],
    );
  }
}