import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/models/WarningModel.dart';
import 'package:flutter/material.dart';

import 'package:acdemy/generated/l10n.dart';

class WarningsTable extends StatelessWidget {
  final List<WarningModel> warnings;

  const WarningsTable({super.key, required this.warnings});


  @override
  Widget build(BuildContext context) {
    int index= 0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 120,
        headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
        columns: [
          DataColumn(label: Text(S.of(context).classNumber)),
          DataColumn(label: Text(S.of(context).gpa)),
          DataColumn(label: Text(S.of(context).academicYear)),
          DataColumn(label: Text(S.of(context).semester)),
        ],
        
        rows: warnings.map((warning) {
          index++;
          return DataRow(
            cells: [
              DataCell(
                Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Text(index.toString()),
              )),
              DataCell(Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Text(warning.gpa.toString()),
              )),
              DataCell(Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Text("${warning.semester.startYear}-${warning.semester.endYear}"),
              )),
              DataCell(Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Text(warning.semester.semester.toString()),
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}
