import 'package:acdemy/Feature/Registration/presention/views/RegistrationView.dart';
import 'package:acdemy/Feature/Registration/presention/views/SelctionCoursesView.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

bool onPressed = true;

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(Registrationview.routeName);

                  setState(() {
                    onPressed = true;
                  });
                },
                child: Container(
                  color: onPressed ? TColor.primaryColor : Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.list,
                          size: 30,
                          color:
                              onPressed ? Colors.white : TColor.primaryColor),
                      Text(S.of(context).courses,
                          style: TTextstyle.bold13.copyWith(
                              color: onPressed
                                  ? Colors.white
                                  : TColor.primaryColor)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(Selctioncoursesview.routeName);
                  setState(() {
                    onPressed = false;
                  });
                },
                child: Container(
                  color: onPressed ? Colors.white : TColor.primaryColor,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check,
                          size: 30,
                          color:
                              onPressed ? TColor.primaryColor : Colors.white),
                      Text(S.of(context).selected,
                          style: TTextstyle.bold13.copyWith(
                              color: onPressed
                                  ? TColor.primaryColor
                                  : Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
