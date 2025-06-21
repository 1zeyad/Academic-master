import 'package:acdemy/Feature/Registration/Data/cubit/my_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/My_Course_Items.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesViewBody extends StatelessWidget {
  const MyCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCoursesCubit, MyCoursesState>(
      listener: (context, state) {
        if (state is MyCourseFailure) {
          CustomErrorMessage(state.erroMessage);
        }
      },
      builder: (context, state) {
        if (state is MyCourseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MycourseSuccess) {
          state.My_courses;
          return ListView.builder(
            itemCount: state.My_courses.length,
            itemBuilder: (context, index) {
              return MyCourseItems(
                my_course: state.My_courses[index],
              );
            },
          );
        } else {
          return Center(child: Text(S.of(context).noData));
        }
      },
    );
  }
}
