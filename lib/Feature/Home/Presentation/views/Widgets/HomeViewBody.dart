import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/AcademicAlertView.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/AcademicTranningView.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/HomeItem.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/info_personal.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/my_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/repo/registration_repo_impl.dart';
import 'package:acdemy/Feature/Registration/presention/views/MyCoursesVIew.dart';
import 'package:acdemy/Feature/Registration/presention/views/RecommendedCoursesView.dart';
import 'package:acdemy/Feature/Registration/presention/views/RegistrationView.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudAcademicDataView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/TermGradesView.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/PlanView.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/RegulationView.dart';
import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';
import 'package:acdemy/core/helperFunction/Cache_Data.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 16),

         const   InfoPersonal(),

          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeItem(
                  icon: Icons.email,
                  label: S.of(context).plan,
                  color: TColor.primaryColor,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () => GoRouter.of(context).push(PlanView.routeName),
                ),
                HomeItem(
                  icon: Icons.school,
                  label: S.of(context).results,
                  color: TColor.primaryColor,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () {
                    context.read<TermGradesCubit>().getTermGrades();
                    GoRouter.of(context).push(TermGradesView.routeName);
                  },
                ),
                HomeItem(
                  icon: Icons.book_online_sharp,
                  label: S.of(context).courses,
                  color: TColor.primaryColor,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () {
                    context.read<MyCoursesCubit>().getMyCourses();
                    GoRouter.of(context).push(MyCoursesView.routename);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2 / 1,
              children: [
                const HomeItemRegistration(),
                HomeItem(
                  icon: Icons.library_books,
                  label: S.of(context).regulation,
                  onTap: () =>
                      GoRouter.of(context).push(Regulationview.routeName),
                ),
                HomeItem(
                  icon: Icons.person,
                  label: S.of(context).academicInfo,
                  onTap: () =>
                      GoRouter.of(context).push(StudAcademicDataView.routeName),
                ),
                HomeItem(
                  icon: Icons.trending_up,
                  label: S.of(context).recommendCourses,
                  onTap: () => GoRouter.of(context)
                      .push(RecommendedCoursesView.routename),
                ),
                HomeItem(
                  icon: Icons.event,
                  label: S.of(context).training,
                  onTap: () {
                    if (getUserAcademicInfo()!.gainedHours < 60) {
                      LocaNotificationServices.showBasicNotification(
                        id: 1,
                        body: 'You have not completed your training hours ${getUserAcademicInfo()!.gainedHours}',
                        title: 'Admin',
                        payload: "training",
                      );
                    } else {
                      GoRouter.of(context).push(Academictranningview.routename);
                    }
                  },
                ),
                HomeItem(
                    icon: Icons.warning,
                    label: S.of(context).academicAlert,
                    onTap: () {
                      context.read<AcademicInfoCubit>().getAcademicInfo();
                      GoRouter.of(context).push(AcademicAlertView.routename);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeItemRegistration extends StatelessWidget {
  const HomeItemRegistration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UpdateAvaliableCoursesCubit>().getRegistrationStatus();
      },
      child: BlocConsumer<UpdateAvaliableCoursesCubit,
          UpdateAvaliableCoursesState>(
        listener: (context, state) {
          if (state is RegistrationStatusSuccess) {
            if (state.status == false) {
              LocaNotificationServices.showBasicNotification(
                id: 3,
                body: 'Registration is Closed',
                title: 'Admin',
                payload: "registration",
              );

              // LocaNotificationServices.cancelNotification(3);
            } else {
              GoRouter.of(context).push(Registrationview.routeName);
            }
          }
        },
        builder: (context, state) {
          return state is RegistrationStatusLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: TColor.primaryColor,
                  ),
                )
              : HomeItem(
                  icon: Icons.school_outlined,
                  label: S.of(context).registration,
                );
        },
      ),
    );
  }
}
