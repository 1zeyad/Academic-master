// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';

import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: TColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: onPressed,
          child: Text(
            text,
            style: TTextstyle.bold16.copyWith(color: Colors.white),
          )),
    );
  }
}
