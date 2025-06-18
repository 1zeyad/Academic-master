import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/Course_Items.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationViewBody extends StatelessWidget {
  const RegistrationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = context.read<UpdateAvaliableCoursesCubit>().List_courses;
    return BlocConsumer<UpdateAvaliableCoursesCubit,
        UpdateAvaliableCoursesState>(
      listener: (context, state) {
        if (state is UpdateAvaliableCoursesFailure) {
          CustomErrorMessage(state.errMessage);
        } else if (state is RemoveCourse) {
          courses = state.available_courses;
        } else if (state is UpdateAvaliableCoursesSuccess) {
          courses = state.available_courses;
        }
      },
      builder: (context, state) {
        return CustomCircleIndicator(
          inAsyncCall: state is UpdateAvaliableCoursesLoading ? true : false,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Courseitem(avaliableCourses: courses[index]);
            },
          ),
        );
      },
    );
  }
}
