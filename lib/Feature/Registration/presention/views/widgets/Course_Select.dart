import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';

import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/Icon_Dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseSelcet extends StatelessWidget {
  const CourseSelcet({
    Key? key,
    required this.avaliableCourses,
  }) : super(key: key);

  @override
  final AvaliableCourses avaliableCourses;
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          color: Colors.white,
          // height: 65,
          child: Card(
            color: Colors.grey[100],
            shadowColor: Colors.white,
            elevation: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Row(
                
                  children: [
                    Expanded(
                      child: Text(
                        avaliableCourses.code,
                        style: TTextstyle.bold13.copyWith(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Text(
                            Localizations.localeOf(context).languageCode == 'en'
                                ? avaliableCourses.name.en
                                : avaliableCourses.name.ar,
                            overflow: TextOverflow.visible),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 20,
                      ),
                    ),
                    const IconDot(
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        "${avaliableCourses.creditHours.toString()} hours",
                        style: TTextstyle.bold13
                            .copyWith(color: TColor.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 23,
                        height: 23,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: TColor.primaryColor,
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            context
                                .read<SelctedCoursesCubit>()
                                .removeCourse_Selction(
                                    courseElements: avaliableCourses);
                            context
                                .read<UpdateAvaliableCoursesCubit>()
                                .addCourse(course_elments: avaliableCourses);
                          },
                          icon: const Icon(Icons.remove,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
