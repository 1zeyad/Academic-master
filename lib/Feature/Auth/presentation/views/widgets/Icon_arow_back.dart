// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acdemy/Feature/Auth/presentation/views/StudentLoginView.dart';
import 'package:acdemy/Feature/Registration/presention/views/RegistrationView.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//class IconArrowBack extends StatelessWidget  sss
class IconArrowBack extends StatelessWidget {
  const IconArrowBack({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const ShapeDecoration(
            color: TColor.primaryColor,
            shape: OvalBorder(),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsetsDirectional.only(
                start: 6,
                end: 0,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Center(
            child: Text(
              text,
              style: TTextstyle.bold16.copyWith(color: TColor.primaryColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class IconArrowBack_NewPassword extends StatelessWidget {
  const IconArrowBack_NewPassword({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const ShapeDecoration(
            color: TColor.primaryColor,
            shape: OvalBorder(),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsetsDirectional.only(
                start: 6,
                end: 0,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).go(StudentLoginView.routename);
            },
          ),
        ),
        const SizedBox(
          width: 65,
        ),
        Text(text,
            style: TTextstyle.bold16.copyWith(color: TColor.primaryColor))
      ],
    );
  }
}
