import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.labeltext,
    this.onSaved,
    this.obscureText = false,
    this.isEmail = false,
    required this.keyboardType,
    required this.hintText,
  });

  final Widget? suffixIcon, prefixIcon;
  final TextInputType keyboardType;
  final String hintText;
  final Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController? controller;
  final String? labeltext;
  final Function(String?)? onChanged;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).fieldIsRequired;
        }

        if (isEmail) {
          final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
          if (!emailRegex.hasMatch(value)) {
            return S.of(context).invalidEmail;
          }
        } else {
          if (value.length < 4 || value.length > 30) {
            return S.of(context).passwordLengthError;
          }
        }

        return null;
      },
      decoration: InputDecoration(
        filled: true,
        labelText: labeltext,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TTextstyle.bold15.copyWith(color: const Color(0xFF949D9E)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
