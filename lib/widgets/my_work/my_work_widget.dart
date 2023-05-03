import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/my_work/work_image_widget.dart';
import 'package:scheduling_appointments_app/widgets/screen_section.dart';

class MyWorkWidget extends StatelessWidget {
  const MyWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSection(
      title: "My Work",
      child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WorkImageWidget(assetPath: "assets/images/my_work_images/image_1.png"),
                WorkImageWidget(assetPath: "assets/images/my_work_images/image_1.png"),
                WorkImageWidget(assetPath: "assets/images/my_work_images/image_1.png"),
                WorkImageWidget(assetPath: "assets/images/my_work_images/image_1.png"),
                WorkImageWidget(assetPath: "assets/images/my_work_images/image_1.png"),
              ],
          ),
      ),
    );
  }
}