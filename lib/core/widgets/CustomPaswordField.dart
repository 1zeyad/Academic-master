import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomTextField.dart';

import 'package:flutter/material.dart';

class CustomPaswordFeild extends StatefulWidget {
  const CustomPaswordFeild(
      {Key? key,
   
      this.controller,
      this.hintText,
      this.onChanged})
      : super(key: key);
  // final Function(String?)? onSaved;

  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final String? hintText;

  @override
  State<CustomPaswordFeild> createState() => _CustomPaswordFeildState();
}

class _CustomPaswordFeildState extends State<CustomPaswordFeild> {
  bool onvisible = true;
  @override
  Widget build(BuildContext context) {
    final hint = widget.hintText ?? S.of(context).password;
    return CustomTextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      hintText: hint,
      obscureText: onvisible,
      // onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      isEmail: false, 
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            onvisible = !onvisible;
          });
        },
        icon: Icon(
          !onvisible ? Icons.remove_red_eye : Icons.visibility_off,
          color: TColor.primaryColor,
        ),
      ),
    );
  }
}
