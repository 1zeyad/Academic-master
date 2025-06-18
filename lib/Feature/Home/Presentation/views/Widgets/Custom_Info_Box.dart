import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:flutter/material.dart';

class CustomInfoBox extends StatelessWidget {
  final String title;
  final String value;
  const CustomInfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TTextstyle.bold19.copyWith(color: Colors.white)),
        const SizedBox(height: 5),
        Text(title, style: TTextstyle.semiBold13.copyWith(color: Colors.white)),
      ],
    );
  }
}