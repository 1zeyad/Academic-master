// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acdemy/Feature/Registration/Data/cubit/course_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/ProfileItem.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCourseViewBody extends StatelessWidget {
  const InfoCourseViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseInfoCubit, CourseInfoState>(
      listener: (context, state) {
        if (state is CourseInfoFailure) {
          CustomErrorMessage(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CourseInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CourseInfoSuccess) {
          return Card(
            elevation: 2,
            color: Colors.white,
            shadowColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    Localizations.localeOf(context).languageCode == 'en'
                        ? state.course_info.name.en
                        : state.course_info.name.ar,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: TColor.lightPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ProfileItem(
                      icon: Icons.account_balance,
                      label: S.of(context).code,
                      value: state.course_info.code),
                  const Divider(
                    height: 8,
                    indent: 3,
                    endIndent: 7,
                  ),
                  ProfileItem(
                      icon: Icons.calendar_month,
                      label: S.of(context).lectureHours,
                      value: state.course_info.lectureHours),
                  const Divider(
                    height: 8,
                    indent: 3,
                    endIndent: 7,
                  ),
                  ProfileItem(
                      icon: Icons.school,
                      label: S.of(context).practicalHours,
                      value: state.course_info.practicalHours),
                  const Divider(
                    height: 8,
                    indent: 3,
                    endIndent: 7,
                  ),
                  ProfileItem(
                      icon: Icons.account_balance,
                      label: S.of(context).creditHours,
                      value: state.course_info.creditHours),
                  const Divider(
                    height: 8,
                    indent: 3,
                    endIndent: 7,
                  ),
                  ProfileItem(
                      icon: Icons.account_balance,
                      label: S.of(context).level,
                      value: state.course_info.level),
                  const Divider(
                    height: 8,
                    indent: 3,
                    endIndent: 7,
                  ),
                  ProfileItem1(
                    icon: Icons.grade,
                    label: S.of(context).prerequisite,
                    value: Localizations.localeOf(context).languageCode == 'en'
                        ? state.course_info.prerequisite?.name.en ??
                            S.of(context).noPrerequisite
                        : state.course_info.prerequisite?.name.ar ??
                            S.of(context).noPrerequisite,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text(S.of(context).noData));
        }
      },
    );
  }
}

class ProfileItem1 extends StatelessWidget {
  final IconData icon;
  final String label;
  final dynamic value;

  const ProfileItem1({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: TColor.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TTextstyle.bold15),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(value.toString(),
                      style: TextStyle(color: Colors.grey[700])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
