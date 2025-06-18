
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/TermGradesViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermGradesView extends StatelessWidget {
  const TermGradesView({super.key});

  static const routeName = '/TermGradesView';
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Custom_App_Bar(text: S.of(context).courseGrades, context: context),
      body: const Termgradesviewbody(),
    );
  }
}
