import 'package:acdemy/Feature/StudentData/presentation/views/widgets/StudAcademicDataViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class StudAcademicDataView extends StatelessWidget {
  const StudAcademicDataView({super.key});

  @override
  static const routeName = '/StudAcademicDataView';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Custom_App_Bar(text: S.of(context).academicData, context: context),
      body: const StudAcademicDataViewBody(),
    );
  }
}
