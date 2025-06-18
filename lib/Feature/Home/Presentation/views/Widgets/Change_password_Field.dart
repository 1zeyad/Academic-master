import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordField extends StatefulWidget {
  const ChangePasswordField({
    super.key,
    required this.hintText,
    required this.onSaved,
  });

  final String hintText;
  final Function(String?) onSaved;

  @override
  State<ChangePasswordField> createState() => _ChangePasswordFieldState();
}

class _ChangePasswordFieldState extends State<ChangePasswordField> {
  bool onvisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: onvisible,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).fieldIsRequired;
        }
        if (value.length < 4 || value.length > 12) {
          return S.of(context).passwordLengthError;
        }
        return null;
      },
      style: const TextStyle(color: TColor.primaryColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TTextstyle.bold13.copyWith(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                onvisible = !onvisible;
              });
            },
            icon: Icon(
              !onvisible ? Icons.remove_red_eye : Icons.visibility_off,
            ),
            color: TColor.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
