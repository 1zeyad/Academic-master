import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/AcademicAlertView.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/AcademicTranningView.dart';
import 'package:acdemy/Feature/Auth/presentation/views/Forget_Password_View.dart';
import 'package:acdemy/Feature/Auth/presentation/views/New_Password_view.dart';
import 'package:acdemy/Feature/Auth/presentation/views/SplachView.dart';
import 'package:acdemy/Feature/Auth/presentation/views/StudentLoginView.dart';
import 'package:acdemy/Feature/Auth/presentation/views/Verify_code_View.dart';
import 'package:acdemy/Feature/Home/Presentation/views/ChangePassword_View.dart';
import 'package:acdemy/Feature/Home/Presentation/views/HomeView.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/CustomButtonNavigation_Bar.dart';
import 'package:acdemy/Feature/Registration/presention/views/InfoCourseView.dart';
import 'package:acdemy/Feature/Registration/presention/views/RecommendedCoursesView.dart';
import 'package:acdemy/Feature/Registration/presention/views/RegistrationView.dart';
import 'package:acdemy/Feature/Registration/presention/views/SelctionCoursesView.dart';
import 'package:acdemy/Feature/Registration/presention/views/MyCoursesVIew.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudAcademicDataView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudPersonalDataView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/TermGradesView.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/StudentView.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/PlanView.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/RegulationView.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  static String? get id => CacheHelper.getData(key: Keys.id_User);

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: HomeView.routeName,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: HomeView(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   ),
      // ),
      GoRoute(
        path: CustomButtonNavigationBar.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: CustomButtonNavigationBar(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      GoRoute(
        path: HomeView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: AcademicAlertView.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AcademicAlertView(),
        ),
      ),
      GoRoute(
        path: Academictranningview.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Academictranningview(),
        ),
      ),

      GoRoute(
        path: ForgetPasswordView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgetPasswordView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: ChangepasswordView.routename,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ChangepasswordView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),

      GoRoute(
        path: '/', 
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: 
        id != null ?   CustomButtonNavigationBar() :const  StudentLoginView(), // id != null ?   CustomButtonNavigationBar() : id != null ? BottomBar() :
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),

      GoRoute(
        path: StudentLoginView.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const StudentLoginView(),
        ),
      ),
       GoRoute(
        path: RecommendedCoursesView.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RecommendedCoursesView(),
        ),
      ),

      GoRoute(
        path: StudPersonalDataView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const StudPersonalDataView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: StudAcademicDataView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const StudAcademicDataView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Infocourseview.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Infocourseview(),
        ),
      ),

      GoRoute(
        path: Splachview.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Splachview(),
        ),
      ),

      GoRoute(
        path: PlanView.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const PlanView(),
        ),
      ),

      GoRoute(
        path: Regulationview.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Regulationview(),
        ),
      ),

      // GoRoute(
      //   path: Studentview.routeName,
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: const Studentview(),
      //   ),
      // ),

      // GoRoute(
      //   path: Infocourseview.routeName,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const Infocourseview(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return FadeTransition(
      //         opacity: animation,
      //         child: child,
      //       );
      //     },
      //   ),
      // ),

      GoRoute(
        path: Registrationview.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Registrationview(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: TermGradesView.routeName,
        name: 'grades',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TermGradesView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),

      GoRoute(
        path: Selctioncoursesview.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Selctioncoursesview(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: VerifyCodeView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const VerifyCodeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      //h
      GoRoute(
        path: NewPasswordView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NewPasswordView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: MyCoursesView.routename,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MyCoursesView(),
        ),
      ),
    ],
  );
}
