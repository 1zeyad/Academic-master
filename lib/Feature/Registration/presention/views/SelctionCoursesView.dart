import 'package:acdemy/Feature/Registration/presention/views/widgets/Custom_Bottom_NavigationBar.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/SelectionCoursesViewBody.dart';

import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/helperFunction/inside_AppBar.dart';
import 'package:flutter/material.dart';

class Selctioncoursesview extends StatelessWidget {
  const Selctioncoursesview({super.key});
  static const routeName = '/Selctioncoursesview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: Custom_inside_AppBar(
          context: context, textKey: S.of(context).selectCourses),
      // drawer: const Custom_Drawer(),
      body: const SelectionCoursesViewBody(),
    );
  }
}
