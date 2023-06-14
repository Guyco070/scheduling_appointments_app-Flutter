import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/screens/login_screen.dart';
import 'package:scheduling_appointments_app/screens/user_home_page.dart';
import 'package:scheduling_appointments_app/screens/about_screen.dart';

import 'package:snippet_coder_utils/hex_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: HexColor("#76706B"),
        )
      ),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        UserHomePage.routeName:(context) => const UserHomePage(),
        AboutScreen.routeName:(context) => const AboutScreen(),
      },
    );
  }
}
