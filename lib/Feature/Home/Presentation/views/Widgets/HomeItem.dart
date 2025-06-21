import 'package:flutter/material.dart';
import 'package:acdemy/core/utiles/app_color.dart';


class HomeItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final void Function()? onTap;

  const HomeItem({
    super.key,
    required this.icon,
    required this.label,
    this.color = Colors.white,
    this.iconColor = TColor.lightPrimaryColor3,
    this.textColor = TColor.primaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap:  onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold)
                    .copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
