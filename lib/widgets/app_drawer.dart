import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/screens/about_screen.dart';
import 'package:scheduling_appointments_app/widgets/custom_app_bar.dart';
import 'package:scheduling_appointments_app/utils/config.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Config.safePaddingHeight(context: context)),
            const CustomAppBar(
              title: "Menu",
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height > 650 ? MediaQuery.of(context).size.height - 650 : 30,
            ),
            const Divider(
              indent: 18,
              endIndent: 18,
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About"),
              onTap: () =>
                  Navigator.pushNamed(context, AboutScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }

  Text title(String title) => Text(
        title,
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
      );

  List<Widget> devidedTitle(String title) => [
        const Divider(),
        Text(
          title,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        const Divider(
          indent: 18,
          endIndent: 18,
        ),
      ];
}
