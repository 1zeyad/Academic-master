import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_state.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/Course_Select.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCoursesViewBody extends StatelessWidget {
  const SelectionCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = context.read<SelctedCoursesCubit>().selectedCourses;
    int RegisterHours() {
      int totalHours = 0;
      for (int i = 0; i < courses.length; i++) {
        totalHours += courses[i].creditHours;
      }
      return totalHours;
    }

    return BlocConsumer<SelctedCoursesCubit, SelctedCoursesState>(
      listener: (context, state) {
        if (state is AddCourseSection) {
          courses = state.available_courses;
        } else if (state is RemoveCourseSelection) {
          courses = state.available_courses;
        } else if (state is SelctedCoursesFailure) {
          CustomErrorMessage(state.errMessage);
        } else if (state is SelctedCoursesSuccess) {
          CustomErrorMessage(state.message);
        }
      },
      builder: (context, state) {
        return CustomCircleIndicator(
          inAsyncCall: state is SelctedCoursesLoading ? true : false,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CourseSelcet(avaliableCourses: courses[index]);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Visibility(
                              visible: courses.isNotEmpty,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: TColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                            ),
                            onPressed: () {
                              var coursess = context
                                  .read<SelctedCoursesCubit>()
                                  .selectedCourses;
                              List<String> id_Coursess = [];
                              for (var element in coursess) {
                                id_Coursess.add(element.id);
                              }
                              context
                                  .read<SelctedCoursesCubit>()
                                  .courseRegistration(id_Courses: id_Coursess);
                            },
                            child: Text(
                              S.of(context).register,
                              style: TTextstyle.bold16
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: courses.isNotEmpty,
                          child: Text(
                            "${S.of(context).hours}: ${RegisterHours()}",
                            style: TTextstyle.bold16
                                .copyWith(color: TColor.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
