import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/recommend_course_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/ItemRecommendedCourse.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedCourseViewBody extends StatelessWidget {
  const RecommendedCourseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendCourseCubit, RecommendCourseState>(
      listener: (context, state) {
        if (state is RecommendCourseFailure) {
          CustomErrorMessage(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is RecommendCourseLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: TColor.primaryColor,
            ),
          );
        } else if (state is RecommendCourseSuccess) {
          var recommendedCourses = state.Recommended_courses;
          return ListView.builder(
              itemCount: recommendedCourses.length,
              itemBuilder: (context, index) {
                return ItemRecommndedCourse(
                  RecommendedCourses: recommendedCourses[index],
                );
              });
        } else {
          return Center(
            child: Text(S.of(context).noData),
          );
        }
      },
    );
  }
}
