import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

AppBar Custom_App_Bar({required BuildContext context, required String text}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: TColor.primaryColor,
    // iconTheme: const IconThemeData(color: Colors.white),
    centerTitle: true,
    title: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
