import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/course_info_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/InfoCourseView.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemRecommndedCourse extends StatelessWidget {
  const ItemRecommndedCourse({
    super.key,
    required this.RecommendedCourses,
  });

  @override
  final AvaliableCourses RecommendedCourses;
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: Card(
          color: Colors.white54,
          shadowColor: Colors.white,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 00, vertical: 0),
            child: ListTile(
              title: Text(
                Localizations.localeOf(context).languageCode == 'en'
                    ? RecommendedCourses.name.en
                    : RecommendedCourses.name.ar,
                style: TTextstyle.bold13.copyWith(color: TColor.primaryColor),
              ),
              subtitle: Text(
                RecommendedCourses.code,
                style: TTextstyle.bold13.copyWith(color: Colors.grey),
              ),
              trailing: IntrinsicWidth(
                child: SizedBox(
                  height: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: TColor.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<CourseInfoCubit>()
                          .getCourseDetails(id: RecommendedCourses.id);
                      GoRouter.of(context).push(Infocourseview.routeName);
                    },
                    child: Text(S.of(context).info, style: TTextstyle.bold9),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
