import 'package:flutter/material.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/Icon_Dot.dart';

class MyCourseItems extends StatelessWidget {
  const MyCourseItems({
    Key? key,
    required this.my_course,
  }) : super(key: key);
  final AvaliableCourses my_course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
      child: Container(
        height: 65,
        child: Card(
          color: Colors.grey[100],
          elevation: 1,
          shadowColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    my_course.code,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'en'
                          ? my_course.name.en
                          : my_course.name.ar,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1.5),
                          child: IconDot(),
                        ),
                        Text(
                          " ${my_course.creditHours} ${S.of(context).hours}",
                          style: TTextstyle.bold13
                              .copyWith(color: TColor.primaryColor),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.green,
                          child:
                              Icon(Icons.check, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
