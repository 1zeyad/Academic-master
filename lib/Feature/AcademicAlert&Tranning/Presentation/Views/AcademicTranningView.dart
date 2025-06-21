import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/Widgets/AcademicTranningViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:acdemy/generated/l10n.dart';

class Academictranningview extends StatelessWidget {
  const Academictranningview({super.key});

  @override
  static const String routename = '/Academictranningview';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_App_Bar(
          text: S.of(context).academicTraining, context: context),
      body: const Academictranningviewbody(),
    );
  }
}
