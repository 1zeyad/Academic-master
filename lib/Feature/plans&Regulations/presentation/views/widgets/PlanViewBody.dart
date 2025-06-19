import 'package:acdemy/Feature/plans&Regulations/Data/cubit/plan_cubit.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanViewBody extends StatefulWidget {
  @override
  _PlanViewBodyState createState() => _PlanViewBodyState();
}

class _PlanViewBodyState extends State<PlanViewBody> {
  int? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanCubit, PlanState>(
      listener: (context, state) {
        if (state is PlanFailure) {
          CustomErrorMessage(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PlanSuccess) {
          final data = state.Plans;
          final levels = data.map((e) => e.level).toSet().toList()..sort();

          final filteredData = selectedLevel == null
              ? []
              : data.where((e) => e.level == selectedLevel).toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Dropdown List
                DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                    hintText: S.of(context).select_level,
                    hintStyle:const  TextStyle(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                       const  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: TColor.primaryColor),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  value: selectedLevel,
                  onChanged: (value) {
                    setState(() {
                      selectedLevel = value;
                    });
                  },
                  items: levels.map((level) {
                    return DropdownMenuItem<int>(
                      value: level,
                      child: Text("${S.of(context).level} $level"),
                    );
                  }).toList(),
                ),
                
                
                
                const SizedBox(height: 20),

                if (filteredData.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final semesterData = filteredData[index];
                        return Card(
                          elevation: 2,
                          color: Colors.grey[100],
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                            title: Text(
                                "${S.of(context).semester} ${semesterData.semester}"),
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 20,
                                  columns: [
                                    DataColumn(label: Text(S.of(context).code)),
                                    DataColumn(label: Text(S.of(context).name)),
                                    DataColumn(
                                        label: Text(S.of(context).credits)),
                                    DataColumn(
                                        label:
                                            Text(S.of(context).lecture_hours)),
                                    DataColumn(
                                        label: Text(
                                            S.of(context).practical_hours)),
                                  ],
                                  rows: semesterData.courses
                                      .map<DataRow>((course) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text(course.code)),
                                        DataCell(
                                          Text(
                                            Localizations.localeOf(context)
                                                         .languageCode ==
                                                    'en'
                                                ? course.name.en
                                                : course.name.ar,
                                          ),
                                        ),
                                        DataCell(Text(
                                            course.creditHours.toString())),
                                        DataCell(Text(
                                            course.lectureHours.toString())),
                                        DataCell(Text(
                                            course.practicalHours.toString())),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        } else if (state is PlanLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: TColor.primaryColor,
            ),
          );
        } else {
          return  const SizedBox();
        }
      },
    );
  }
}
