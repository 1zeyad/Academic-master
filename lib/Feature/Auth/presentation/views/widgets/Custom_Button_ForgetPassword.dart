
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

class Custom_Button_ForgetPassword extends StatelessWidget {
  const Custom_Button_ForgetPassword({
    super.key,
    required this.isButtonEnabled,
    required this.Controller,
    required this.text,
    required this.onPressed,
  });

  final bool isButtonEnabled;
  final String text;
  final TextEditingController Controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: TColor.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
