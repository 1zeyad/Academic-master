import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class GraduationInfo extends StatelessWidget {
  const GraduationInfo({
    super.key,
    required this.progress,
    required this.remainingHours,
  });

  final double progress;
  final int remainingHours;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 225,
        height: 222,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              backgroundColor: Colors.grey[300],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(TColor.primaryColor),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$remainingHours",
                      style:
                         const  TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(S.of(context).hoursToGraduate,
                      textAlign: TextAlign.center, style: TTextstyle.normal16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
