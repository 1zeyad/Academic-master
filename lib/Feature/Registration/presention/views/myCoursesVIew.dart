import 'package:acdemy/Feature/Registration/presention/views/widgets/MyCoursesViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  static const String routename = '/MyCoursesView';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_App_Bar(text: S.of(context).myCourses, context: context),
      body: const MyCoursesViewBody(),
    );
  }
}
