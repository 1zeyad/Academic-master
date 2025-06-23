import 'package:acdemy/Feature/Home/Presentation/views/Widgets/CustomButtonNavigation_Bar.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/Custom_Bottom_Registration_NavigationBar.dart';
import 'package:acdemy/Feature/Registration/presention/views/widgets/RegistrationViewBody.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Registrationview extends StatelessWidget {
  const Registrationview({super.key});
  static const routeName = '/Registrationview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25),
          onPressed: () {
            GoRouter.of(context).go(CustomButtonNavigationBar.routeName);
          },
        ),
        backgroundColor: TColor.primaryColor,
        centerTitle: true,
        title: Text(
          S.of(context).registration,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: const RegistrationViewBody(),
    );
  }
}
