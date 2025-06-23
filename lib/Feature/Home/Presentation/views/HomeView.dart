import 'dart:async';
import 'dart:developer';


import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/HomeAppBar.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/HomeViewBody.dart';
import 'package:acdemy/Feature/Registration/presention/views/RegistrationView.dart';
import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  StreamSubscription? notificationSubscription;

  void _listenToResponseNotification() {
    notificationSubscription?.cancel();

    notificationSubscription =
        LocaNotificationServices.streamController.stream.listen(
      (notificationResponse) {
     
        if (notificationResponse.payload == 'REGISTRATION') {
          GoRouter.of(context).push(Registrationview.routeName);
        }
      },
    );
  }

void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    _listenToResponseNotification();

    
  });
}


  @override
  void dispose() {
    notificationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Homw_App_Bar(
        context,
        () {
          Locale currentLocale = Localizations.localeOf(context);
          Locale newLocale = currentLocale.languageCode == 'en'
              ? const Locale('ar')
              : const Locale('en');

          AcademicData.setLocale(context, newLocale);
        },
      ),
      body: HomeViewBody(),
    );
  }
}

class AcademicData {
  static void setLocale(BuildContext context, Locale newLocale) {}
}
