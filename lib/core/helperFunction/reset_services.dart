import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/my_courses_cubit.dart';

void resetAllCubits(context) {
  context.read<AcademicInfoCubit>().resetState();
  context.read<PersonalInfoCubit>().resetState();
  context.read<TermGradesCubit>().resetState();
  context.read<MyCoursesCubit>().resetState();
  
  // أضف باقي الـ cubits هنا حسب الحاجة
}