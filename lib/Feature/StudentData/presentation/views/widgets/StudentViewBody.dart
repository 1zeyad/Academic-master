import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudAcademicDataView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudPersonalDataView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/TermGradesView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/Custom_field_info.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Studentviewbody extends StatelessWidget {
  const Studentviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custom_Field_info(
          onTap: () {
            // context.read<PersonalInfoCubit>().getPersonalInfo();
            GoRouter.of(context).push(StudPersonalDataView.routeName);
          },
          text: S.of(context).personalData,
          icon: const Icon(
            Icons.perm_identity,
            size: 23,
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.white,
          thickness: 3,
        ),
        Custom_Field_info(
          onTap: () {
            // context.read<AcademicInfoCubit>().getAcademicInfo();
            GoRouter.of(context).push(StudAcademicDataView.routeName);
          },
          text: S.of(context).academicData,
          icon: const Icon(
            Icons.account_balance,
            size: 21,
          ),
        ),
        const Divider(height: 0, color: Colors.white, thickness: 3),
        Custom_Field_info(
          onTap: () {
            context.read<TermGradesCubit>().getTermGrades();
            GoRouter.of(context).push(TermGradesView.routeName);
          },
          text: S.of(context).coursesGrades,
          icon: const Icon(
            Icons.assessment,
            size: 22,
          ),
        ),
        Divider(height: 0, color: Colors.white, thickness: 3),

        // Add grades
      ],
    );
  }
}
