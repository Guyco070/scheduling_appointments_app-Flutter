import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/app_drawer.dart';
import 'package:scheduling_appointments_app/widgets/custom_app_bar.dart';
import 'package:scheduling_appointments_app/widgets/my_work/my_work_widget.dart';
import 'package:scheduling_appointments_app/widgets/schedule/next_turn_day_widget.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  static const routeName = 'user_home_page';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
          noBackBotton: true,
          includeLogo: true,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.drag_indicator_outlined,
                  color: Config.onLogoIconColor,
                ));
          }),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MyWorkWidget(),
            NextTurnDayWidget(),
          ],
        ),
      ),
    );
  }
}