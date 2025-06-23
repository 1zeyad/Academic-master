import 'package:acdemy/Feature/plans&Regulations/Data/Models/Regulation_Model.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/cubit/regulation_cubit.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegulationViewBody extends StatefulWidget {
  const RegulationViewBody({super.key});

  @override
  State<RegulationViewBody> createState() => _RegulationViewBodyState();
}

class _RegulationViewBodyState extends State<RegulationViewBody> {
  String? selectedSection;
  Map<String, dynamic>? regulationData;

  String _getTranslatedKey(String key) {
    switch (key) {
      case 'maxRegistrationHours': return S.of(context).maxRegistrationHours;
      case 'normalRegistrationHours': return S.of(context).normalRegistrationHours;
      case 'minRegistrationHours': return S.of(context).minRegistrationHours;
      case 'gpaForMaxHours': return S.of(context).gpaForMaxHours;
      case 'summerTermHours': return S.of(context).summerTermHours;
      case 'regulationHours': return S.of(context).regulationHours;
      case 'levelsCount': return S.of(context).levelsCount;
      case 'semestersWithoutGpaRules': return S.of(context).semestersWithoutGpaRules;
      case 'mandatoryHours': return S.of(context).mandatoryHours;
      case 'optionalHours': return S.of(context).optionalHours;
      case 'requiredHours': return S.of(context).requiredHours;
      case 'creditHours': return S.of(context).creditHours;
      case 'maxRetakeGrade': return S.of(context).maxRetakeGrade;
      case 'maxRetakeCourses': return S.of(context).maxRetakeCourses;
      case 'maxConsecutiveWarnings': return S.of(context).maxConsecutiveWarnings;
      case 'maxYearsLevelOne': return S.of(context).maxYearsLevelOne;
      case 'minGpaForGraduation': return S.of(context).minGpaForGraduation;
      case 'gradProjectRequirements': return S.of(context).gradProjectRequirements;
      case 'trainingRequirements': return S.of(context).trainingRequirements;
      default: return key;
    }
  }

  Map<String, String> getSectionNames(BuildContext context) {
    return {
      "registrationRules": S.of(context).registrationRules,
      "academicRequirements": S.of(context).academicRequirements,
      "specializationRequirements": S.of(context).specializationRequirements,
      "universityRequirements": S.of(context).universityRequirements,
      "facultyRequirements": S.of(context).facultyRequirements,
      "basicScienceRequirements": S.of(context).basicScienceRequirements,
      "retakeRules": S.of(context).retakeRules,
      "dismissalRules": S.of(context).dismissalRules,
      "levels": S.of(context).levels,
      "courseGpaRanges": S.of(context).courseGpaRanges,
      "cumGpaRanges": S.of(context).cumGpaRanges,
    };
  }

  @override
  Widget build(BuildContext context) {
    final sectionNames = getSectionNames(context);

    return BlocConsumer<RegulationCubit, RegulationState>(
      listener: (context, state) {
        if (state is RegulationFailure) {
          CustomErrorMessage(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is RegulationSuccess) {
          if (regulationData == null) {
            final regulation = state.regulation as Regulation;
            //convert regulation to Map
            regulationData = regulation.toMap();
          }

          return Padding(
            padding: const EdgeInsets.only(top:16,left: 8,right: 8),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).selectSection,
                    labelStyle: const TextStyle(color: TColor.primaryColor, fontSize: 16),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: TColor.primaryColor),
                    ),
                  ),
                  value: selectedSection,
                  // item section
                  items: sectionNames.entries.map((e) {
                    return DropdownMenuItem(value: e.key, child: Text(e.value));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSection = value;
                    });
                  },
                ),
                
                const SizedBox(height: 20),
                if (selectedSection != null && regulationData != null && regulationData!.containsKey(selectedSection))
                  Expanded(child: buildSectionContent(selectedSection!))
                else if (selectedSection != null)
                  const Text("No Data"),
              ],
            ),
          );
        } else if (state is RegulationLoading) {
          return const Center(child: CircularProgressIndicator(color: TColor.primaryColor));
        } else if (state is RegulationFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: Text(S.of(context).noData));
        }
      },
    );
  }

  // item section Details
  Widget buildSectionContent(String key) {
    final data = regulationData?[key];
    final sectionTitle = getSectionNames(context)[key] ?? key;

    return SizedBox.expand(
      
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title content 
            Padding(
              padding: const EdgeInsets.only(left:6),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(sectionTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            ),
            const SizedBox(height: 10),
            // content Details
            Expanded(
              child: Card(
                
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: buildDataTable(key, data),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDataTable(String key, dynamic data) {
    if (data is Map<String, dynamic>) {
      final columns = [
        DataColumn(label: Text(S.of(context).requirements, style: const TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text(S.of(context).hours, style: const TextStyle(fontWeight: FontWeight.bold))),
      ];
      final rows = data.entries.expand((entry) {
        if (entry.value is Map<String, dynamic>) {
          final subMap = entry.value as Map<String, dynamic>;
          return [
            DataRow(cells: [
              DataCell(Text(_getTranslatedKey(entry.key), style: const TextStyle(fontWeight: FontWeight.bold))),
              const DataCell(Text("No Data")),
            ]),
            ...subMap.entries.map((subEntry) {
              return DataRow(cells: [
                DataCell(Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(_getTranslatedKey(subEntry.key)),
                )),
                DataCell(Text(subEntry.value.toString())),
              ]);
            }),
          ];
        } else {
          return [
            DataRow(cells: [
              DataCell(Text(_getTranslatedKey(entry.key))),
              DataCell(Text(entry.value.toString())),
            ])
          ];
        }
      }).toList();
      return DataTable(columns: columns, rows: rows);
    } else if (data is List) {
      if (key == "courseGpaRanges") {
        return DataTable(
          columns: [
            DataColumn(label: Text(S.of(context).grade)),
            DataColumn(label: Text(S.of(context).from)),
            DataColumn(label: Text(S.of(context).to)),
            DataColumn(label: Text(S.of(context).gpa)),
          ],
          rows: data.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['name'].toString())),
              DataCell(Text(item['from'].toString())),
              DataCell(Text(item['to'].toString())),
              DataCell(Text(item['gpa'].toString())),
            ]);
          }).toList(),
        );
      } else if (key == "cumGpaRanges") {
        return DataTable(
          columns: [
            DataColumn(label: Text(S.of(context).grade)),
            DataColumn(label: Text(S.of(context).from)),
            DataColumn(label: Text(S.of(context).to)),
          ],
          rows: data.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['name'].toString())),
              DataCell(Text(item['from'].toString())),
              DataCell(Text(item['to'].toString())),
            ]);
          }).toList(),
        );
      } else if (key == "levels") {
        return DataTable(
          columns: [
            DataColumn(label: Text(S.of(context).level)),
            DataColumn(label: Text(S.of(context).hourRequirements)),
          ],
          rows: data.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['value'].toString())),
              DataCell(Text(item['reqHours'].toString())),
            ]);
          }).toList(),
        );
      }
    }
    return const SizedBox.shrink();
  }
}
