import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/StudentLoginView.dart';
import 'package:acdemy/Feature/Home/Presentation/views/HomeView.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/course_info_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/my_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/recommend_course_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudPersonalDataView.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  @override
  _CustomButtonNavigationBarState createState() =>
      _CustomButtonNavigationBarState();
  static const String routeName = '/BottomBar';
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  @override
  void initState() {
    super.initState();

    final personalcubit = context.read<PersonalInfoCubit>();
    if (personalcubit.state is! PersonalInfoSuccess) {
      personalcubit.getPersonalInfo();
    }

    final updateAvaliableCoursesCubit= context.read<UpdateAvaliableCoursesCubit>();
    if (updateAvaliableCoursesCubit.state is UpdateAvaliableCoursesInitial) {
      updateAvaliableCoursesCubit.getavailableCourses();
    }
  }

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeView(),
    const StudPersonalDataView(),
    const StudentLoginView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Card(
        color: Colors.white,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _onTap(0);
                },
                child: Icon(
                  Icons.home,
                  color: _selectedIndex == 0
                      ? TColor.lightPrimaryColor3
                      : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () => _onTap(1),
                child: Icon(
                  Icons.person,
                  color: _selectedIndex == 1
                      ? TColor.lightPrimaryColor3
                      : Colors.grey,
                ),
              ),
              InkWell(
                onTap: () async {
                  await CacheHelper.clearData();
                  resetCubits(context);

                  GoRouter.of(context).go(StudentLoginView.routename);
                },
                child: Icon(
                  Icons.logout,
                  color: _selectedIndex == 2
                      ? TColor.lightPrimaryColor3
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetCubits(BuildContext context) {
    context.read<MyCoursesCubit>().resetState();
    context.read<UpdateAvaliableCoursesCubit>().resetState();
    context.read<PersonalInfoCubit>().resetState();
    context.read<AcademicInfoCubit>().resetState();
    context.read<TermGradesCubit>().resetState();
    context.read<SelctedCoursesCubit>().resetState();
    context.read<ForgetPasswordCubit>().resetState();
    context.read<CourseInfoCubit>().resetState();
    context.read<RecommendCourseCubit>().resetState();
    
  }
}
