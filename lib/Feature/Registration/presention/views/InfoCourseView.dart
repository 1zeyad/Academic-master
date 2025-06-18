import 'package:acdemy/Feature/Registration/presention/views/widgets/InfoCourseViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class Infocourseview extends StatelessWidget {
  const Infocourseview({super.key});

  @override
  static const routeName = '/Infocourseview';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_App_Bar(text: S.of(context).courseInfo, context: context),
      body: const Scaffold(
        body: InfoCourseViewBody(),
      ),
    );
  }
}
