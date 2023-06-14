import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/animated/custom_expanded_list_view.dart';
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
  String chosenTime = '';

  @override
  void initState() {
    getTimeWidgets();
    super.initState();
  }

  getTimeWidgets(){
    for(int i = 9, j = 0; i < 21; j = (j + 15) % 60) {
      String timeText = i.toString();
      timeText = timeText.length == 2 ? timeText : '0$timeText';
      timeText += ':${j.toString().length == 2 ? j.toString() : '00'}';
      if(chosenTime.isEmpty) chosenTime = timeText;
      timeWidgets.add(TimeWidget(timeText, isChosen: chosenTime == timeText, setChosenTime: setChosenTime,));

      if((j+15) % 60 == 0){
        i++;
      }      
    }
    
    setState(() {
      
    });
  }

  updateTimeWidgets(){
    int index = timeWidgets.indexWhere((element) => element.isChosen);
    if(index != -1) timeWidgets[index] = TimeWidget(timeWidgets[index].timeText, isChosen: false, setChosenTime: setChosenTime);

    index = timeWidgets.indexWhere((element) => element.timeText == chosenTime);
    timeWidgets[index] = TimeWidget(timeWidgets[index].timeText, isChosen: true, setChosenTime: setChosenTime);

    setState(() {
      
    });
  }

  setChosenTime(String newChosenTime){
    chosenTime = newChosenTime;

    updateTimeWidgets();
  }

  // setToViewIndex(int newIndex){
  //   setState(() {
  //     toViewIndex = newIndex;
  //   });
  // }

  // increaseIndexToView(){
  //   setToViewIndex(toViewIndex + 10);
  // }

  // decreaseIndexToView(){
  //   setToViewIndex(toViewIndex + 10);
  // }

  @override
  Widget build(BuildContext context) {
    return CustomExpandedListView(
      maxHeight: ((8 + 1) * 50),
      children: [
        Column(
            children: [
            const DatePickerWidget(),
            Config.spaceSmall,
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                ...timeWidgets,
                //.getRange(0, (timeWidgets.length > toViewIndex ? toViewIndex : timeWidgets.length)),
                // IconButton(onPressed: (){
                //   increaseIndexToView();
                // }, 
                // icon: const Icon(Icons.more_horiz_outlined))
              ],
            ),
            Config.spaceSmall,
            ElevatedButton(onPressed: (){}, child: const Text("Schedule"))
          ]
        )
      ],
    );
  }
}