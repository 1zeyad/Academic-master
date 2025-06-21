import 'package:acdemy/Feature/Home/Presentation/views/ChangePassword_View.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:acdemy/main.dart';

AppBar Homw_App_Bar(BuildContext context, VoidCallback onLanguageChange) {
  return AppBar(
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          GoRouter.of(context).push(ChangepasswordView.routename);
        },
        icon: const Icon((Icons.key_sharp)),
      ),
      // IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
    ],
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: TColor.primaryColor,
    title: Center(
      child: Text(
        S.of(context).home,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    leading: TextButton(
      onPressed: () {
        Locale currentLocale = Localizations.localeOf(context);
        Locale newLocale = currentLocale.languageCode == 'en'
            ? const Locale('ar')
            : const Locale('en');
        AcademicData.changeLocale(context, newLocale);
      },
      child: Text(
        Localizations.localeOf(context).languageCode == 'en' ? 'ع' : '𝖊𝖓',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
