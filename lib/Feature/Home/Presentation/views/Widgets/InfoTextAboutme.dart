import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String value;
  const InfoText({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text("$title: ", style:TTextstyle.bold15),
          Text(value),
        ],
      ),
    );
  }
}