import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/CustomTermGrades.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Termgradesviewbody extends StatelessWidget {
  const Termgradesviewbody({super.key});

  String getSemesterName(BuildContext context, int semester) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    switch (semester) {
      case 1:
        return isEnglish
            ? '${S.of(context).first} ${S.of(context).term}'
            : '${S.of(context).term} ${S.of(context).first}';
      case 2:
        return isEnglish
            ? '${S.of(context).second} ${S.of(context).term}'
            : '${S.of(context).term} ${S.of(context).second}';
      case 3:
        return isEnglish
            ? '${S.of(context).summer} ${S.of(context).term}'
            : '${S.of(context).term} ${S.of(context).summer}';
      default:
        return semester.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<TermGradesCubit, TermGradesState>(
        listener: (context, state) {
          if (state is TermGradesFailure) {
            CustomErrorMessage(state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is TermGradesLoading) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const Center(
                child: CircularProgressIndicator(
                  color: TColor.primaryColor,
                ),
              ),
            );
          } else if (state is TermGradesSuccess) {
            return Column(
              children: List.generate(
                state.List_Termgrades.length,
                (index) => CustomTermGrades(
                  context: context,
                  term:
                      '${getSemesterName(context, state.List_Termgrades[index].semester)} ${state.List_Termgrades[index].startYear}-${state.List_Termgrades[index].endYear}',
                  course: state.List_Termgrades[index],
                ),
              ),
            );
          } else {
            return Center(child: Text(S.of(context).noData));
          }
        },
      ),
    );
  }
}
