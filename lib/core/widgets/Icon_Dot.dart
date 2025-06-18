import 'package:flutter/material.dart';

class IconDot extends StatelessWidget {
  final Color color;
  final double size;

  const IconDot({super.key, this.color = Colors.green, this.size =7 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
