import 'package:acdemy/Feature/StudentData/data/Model/term_Grades.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

Widget CustomTermGrades(
    {required BuildContext context, String? term, TermGrades? course}) {
  return Card(
    color: Colors.grey.shade100,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    child: ExpansionTile(
      title: Text(
        '${term!}',
        style: TTextstyle.bold16.copyWith(color: TColor.primaryColor),
      ),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataTable(
                columnSpacing: 30,
                columns: [
                  DataColumn(
                      label: Text(S.of(context).code,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(S.of(context).course,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(S.of(context).credit,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(S.of(context).degree,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(S.of(context).grade,
                          style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: course!.courses.map((course) {
                  return DataRow(cells: [
                    DataCell(Text(course.code)),
                    DataCell(Text(
                      Localizations.localeOf(context).languageCode == 'en'
                          ? course.nameEn
                          : course.nameAr,
                    )),
                    DataCell(Text(course.creditHours.toString())),
                    DataCell(Text(course.degree.toString())),
                    DataCell(Text(course.grade!)),
                  ]);
                }).toList(),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${S.of(context).termGpa}: ${course.gpa}    ",
                        style: TTextstyle.semiBold13),
                    Text( 
                        " Cumulative GPA: ${course.cumGpa}   ",
                        style: TTextstyle.semiBold13),
                    Text(
                        "${S.of(context).attemptedHours}: ${course.totalHours}    ",
                        style: TTextstyle.semiBold13),
                    Text(
                        "${S.of(context).totalEarnedHours}: ${course.gainedHours}    ",
                        style: TTextstyle.semiBold13),

                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// List of courses
