import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/Auth/presentation/views/StudentLoginView.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Splachview extends StatelessWidget {
  const Splachview({super.key});

  @override
  static const String routename = '/Splachview';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      body: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveImage = false;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() => _moveImage = true);

      Future.delayed(Duration(seconds: 2), () {
        setState(() => _showText = true);
      });
      Future.delayed(const Duration(seconds: 3), () {
        GoRouter.of(context).go(StudentLoginView.routename);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Image animation
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
          top: _moveImage ? screenHeight * 0.29 : -200,
          left: 0,
          right: 0,
          child: Center(
              child: SvgPicture.asset(
            "Assets/SplachView.svg",
            width: 160,
            height: 160,
          )),
        ),

        // Text animation
        Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _showText ? 1.0 : 0.0,
            child: Text(
              S.of(context).domittaUniversity,
              style: TTextstyle.bold24.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
