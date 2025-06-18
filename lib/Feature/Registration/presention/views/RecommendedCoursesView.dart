import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo_impl.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/recommend_course_cubit.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/Recommended%20CourseViewbody.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedCoursesView extends StatelessWidget {
  const RecommendedCoursesView({super.key});

  @override
  static const String routename = '/RecommendedCourseViewBody';
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendCourseCubit(
          registrationRepo:
              RegistrationRepoImpl(apiService: DioConsumer(dio: Dio())))
        ..getMyRecommendedCourses(),
      child: Scaffold(
        appBar: Custom_App_Bar(
            context: context, text: S.of(context).recommendedCourses),
        body: const RecommendedCourseViewBody(),
      ),
    );
  }
}
