import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/Data/repos/repo_impl.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo_impl.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/course_info_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/my_courses_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/term_grades_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo_impl.dart';

import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';
import 'package:acdemy/core/helper/Services/PushNotificationServices.dart';
import 'package:acdemy/core/helperFunction/Bloc_observer.dart';
import 'package:acdemy/core/helperFunction/routes.dart';
import 'package:acdemy/firebase_options.dart';


import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_cubit.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/update_avaliable_courses_cubit.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:acdemy/generated/l10n.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  await Future.wait(
      [
        LocaNotificationServices.init(),
         PushNotificationServices.init(),]);

  runApp(const AcademicData());
}

class AcademicData extends StatefulWidget {
  const AcademicData({super.key});

  static void changeLocale(BuildContext context, Locale newLocale) {
    _AcademicDataState? state =
        context.findAncestorStateOfType<_AcademicDataState>();
    state?.changeLocale(newLocale);
  }

  @override
  State<AcademicData> createState() => _AcademicDataState();
}

class _AcademicDataState extends State<AcademicData> {
  Locale _locale = const Locale('en');

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(
      providers: [
        BlocProvider(
           lazy: false,
            create: (context) => SelctedCoursesCubit(
                registrationRepo:
                    RegistrationRepoImpl(apiService: DioConsumer(dio: Dio())))),
        BlocProvider(
            lazy: false,
            create: (context) => ForgetPasswordCubit(
                authRepo: AuthRepoImpl(apiServices: DioConsumer(dio: Dio())))),
        BlocProvider(
           lazy: false,
            create: (context) => CourseInfoCubit(
                registrationRepo:
                    RegistrationRepoImpl(apiService: DioConsumer(dio: Dio())))),
        BlocProvider(
            lazy: false,
            create: (context) => MyCoursesCubit(
                registrationRepo:
                    RegistrationRepoImpl(apiService: DioConsumer(dio: Dio())))),
        BlocProvider(
            lazy: false,
            create: (context) => UpdateAvaliableCoursesCubit(
                  registrationRepo:
                      RegistrationRepoImpl(apiService: DioConsumer(dio: Dio())),
                )),
        BlocProvider(
            lazy: false,
            create: (context) => PersonalInfoCubit(
                repo: RepoImpl(apiService: DioConsumer(dio: Dio())))
             ),
        BlocProvider(
            lazy: true,
            create: (context) => AcademicInfoCubit(
                repo: RepoImpl(apiService: DioConsumer(dio: Dio())))
              ),
        BlocProvider(
            lazy: true,
            create: (context) => TermGradesCubit(
                repo: RepoImpl(apiService: DioConsumer(dio: Dio()))))
      ],
      child: 
      MaterialApp.router(
        locale: _locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'cairo',
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
    
    ));
  }
}
