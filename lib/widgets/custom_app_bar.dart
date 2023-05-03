import 'package:flutter/material.dart';
import 'package:scheduling_appointments_app/utils/config.dart';
import 'package:scheduling_appointments_app/widgets/logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.leading,
      this.trailing,
      this.titleWidget,
      this.noBackBotton = false,
      this.includeLogo = false,
      });

  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? titleWidget;
  final bool noBackBotton;
  final bool includeLogo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(includeLogo)
          Logo('assets/images/app_logo.jpg', buttomRadius: 30,),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: ListTile(
            horizontalTitleGap: 2,
            leading: leading ?? (!noBackBotton ? IconButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                         },
                        icon: const Icon(Icons.chevron_left_outlined)) : null),
             title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 FittedBox(
                   child: Center(
                        child: titleWidget ??
                            Text(
                              title ?? ' ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                      ),
                 ),
               ],
             ),
              trailing: trailing ?? const LimitedBox(), // if no traili
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, Config.safePaddingHeight());
}
