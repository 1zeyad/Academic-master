import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/course_info_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/Registration/presention/views/InfoCourseView.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/Icon_Dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Courseitem extends StatelessWidget {
  const Courseitem({
    Key? key,
    required this.avaliableCourses,
  }) : super(key: key);

  @override
  final AvaliableCourses avaliableCourses;
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(

        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(avaliableCourses.code,
                    style: TTextstyle.bold13.copyWith(color: Colors.grey)),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: IconDot(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "${avaliableCourses.creditHours.toString()} ${S.of(context).hours}",
                      style: TTextstyle.bold13,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Localizations.localeOf(context).languageCode == 'en'
                  ? avaliableCourses.name.en
                  : avaliableCourses.name.ar,
              style: TTextstyle.bold13,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: SizedBox(
                    height: 30,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<CourseInfoCubit>()
                            .getCourseDetails(id: avaliableCourses.id);
                        GoRouter.of(context).push(Infocourseview.routeName);
                      },
                      child: Text(S.of(context).info, style: TTextstyle.bold9),
                    ),
                  ),
                ),
                IconButton(
                    color: TColor.primaryColor,
                    onPressed: () {
                      context
                          .read<SelctedCoursesCubit>()
                          .addCourse_Selction(courseElements: avaliableCourses);
                      context
                          .read<UpdateAvaliableCoursesCubit>()
                          .removeCourse(course_elments: avaliableCourses);
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
