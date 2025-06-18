// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/Models/Regulation_Model.dart';

class Custom_table_GpaRanges extends StatelessWidget {
  const Custom_table_GpaRanges({
    Key? key,
    required this.GpaRanges,
  }) : super(key: key);
  final List<CourseGpaRange> GpaRanges;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          columns: [
            DataColumn(
              label: Text(S.of(context).degree),
            ),
            DataColumn(
              label: Text(S.of(context).grades),
            ),
            DataColumn(
              label: Text(S.of(context).gpa),
            ),
          ],
          rows: GpaRanges.map((e) {
            return DataRow(cells: [
              DataCell(Text(" from: ${e.from} to: ${e.to}")),
              DataCell(Text(e.name)),
              DataCell(Text(e.gpa.toString())),
            ]);
          }).toList()),
    );
  }
}
