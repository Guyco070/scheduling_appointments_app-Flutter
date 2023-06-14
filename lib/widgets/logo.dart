import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(this.assetName, {super.key, this.buttomRadius = 100});
  final String assetName;
  final double buttomRadius;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(buttomRadius),
              bottomRight: Radius.circular(buttomRadius))),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(buttomRadius),
              bottomRight: Radius.circular(buttomRadius)),
          child: Image.asset(
            assetName,
            fit: BoxFit.cover,
          )),
    );
  }
}
