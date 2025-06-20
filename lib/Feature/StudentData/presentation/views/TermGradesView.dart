
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/TermGradesViewBody.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermGradesView extends StatefulWidget {
  const TermGradesView({super.key});

  static const routeName = '/TermGradesView';

  @override
  State<TermGradesView> createState() => _TermGradesViewState();
}

class _TermGradesViewState extends State<TermGradesView> {
  @override  void initState() {
    super.initState();
    final cubit = context.read<TermGradesCubit>();
    if (cubit.state is TermGradesInitial) {
      cubit.getTermGrades();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Custom_App_Bar(text: S.of(context).courseGrades, context: context),
      body: const Termgradesviewbody(),
    );
  }
}
