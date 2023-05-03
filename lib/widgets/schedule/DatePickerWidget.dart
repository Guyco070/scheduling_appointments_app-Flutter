import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as df;

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: DateTime.now().subtract(
                const Duration(days: 365)),
            lastDate: DateTime.now()
                .add(const Duration(days: 365)));
        if (newDate != null) {
          // events.setStartDate(newDate,
          //     setIsLoading: widget.setIsLoading,
          //     setIsLoadingZmanim: widget.setIsLoadingZmanim,);
          setState(() {
            startDate = newDate;
          });
        }
      },
      icon:
          const Icon(Icons.calendar_month_outlined),
      label: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: ((child, animation) =>
            ScaleTransition(
                scale: animation, child: child)),
        child: Text(
            key: ValueKey<String>(
                df.DateFormat('dd/MM/yyyy')
                    .format(startDate)),
            df.DateFormat('dd/MM/yyyy')
                .format(startDate)),
    ));
  }
}