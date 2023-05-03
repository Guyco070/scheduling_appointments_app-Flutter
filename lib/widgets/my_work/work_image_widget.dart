import 'package:flutter/widgets.dart';

class WorkImageWidget extends StatelessWidget {
  WorkImageWidget({
    super.key,
    required this.assetPath
  });

  String assetPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 150,
        child: Image.asset(
          assetPath,
        ),
      ),
    );
  }
}