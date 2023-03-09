import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo(this.assetName, {super.key});
  String assetName;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100))),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
          child: Image.asset(
            assetName,
            fit: BoxFit.cover,
          )),
    );
  }
}
