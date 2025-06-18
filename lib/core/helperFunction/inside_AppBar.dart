import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

AppBar Custom_inside_AppBar(
    {Widget? leading, required BuildContext context, required String textKey}) {
  return AppBar(
    leading: leading,
    automaticallyImplyLeading: false,
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: TColor.primaryColor,
    title: Center(
        child: Text(
      textAlign: TextAlign.center,
      S.of(context).customInsideAppBarTitle,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    )),
  );
}
