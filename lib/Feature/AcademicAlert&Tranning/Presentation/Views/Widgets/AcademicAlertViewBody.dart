import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/cubit/warnings_cubit.dart';
import 'package:acdemy/core/utiles/Text_style.dart';

import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/Widgets/warnings_table.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//
class AcademicAlertViewBody extends StatelessWidget {
  const AcademicAlertViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarningsCubit, WarningsState>(
      builder: (context, state) {
        if (state is WarningsLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: TColor.primaryColor,
          ));
        } else if (state is WarningsFailure) {
          return Center(child: Text(state.error));
        } else if (state is WarningsSuccess && state.warningsList.isNotEmpty) {
          var warningsList = state.warningsList;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: WarningsTable(warnings: warningsList),
          );
        } else {
          return const Center(
            child: Text(
              'No Data',
              style:TTextstyle.normal16
            ),
          );
        }
      },
    );
  }
}

//                table view if there is no data

// import 'package:flutter/material.dart';
// import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/Widgets/warnings_table.dart';
// import 'package:acdemy/Feature/AcademicAlert&Tranning/data/warning_data.dart';

// class AcademicAlertViewBody extends StatelessWidget {
//   const AcademicAlertViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<WarningData> warnings = [];

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 16),
//           Expanded(
//             child: WarningsTable(warnings: warnings),
//           ),
//         ],
//       ),
//     );
//   }
// }


    // final List<WarningData> warningss = [
    //   WarningData(warningNumber: '1', gpa: 0.89, year: '2021-2022', semester: 'الثاني'),
    //   WarningData(warningNumber: '2', gpa: 1.09, year: '2022-2023', semester: 'الثاني'),
    //   WarningData(warningNumber: '3', gpa: 1.13, year: '2023-2024', semester: 'الأول'),
    //   WarningData(warningNumber: '4', gpa: 1.26, year: '2023-2024', semester: 'الثاني'),

    // ];
    // final List<WarningData> warnings = [
    //   WarningData(
    //       warningNumber: '1',
    //       gpa: 0.89,
    //       year: '2021-2022',
    //       semester: S.of(context).secondSemester),
    //   WarningData(
    //       warningNumber: '2',
    //       gpa: 1.09,
    //       year: '2022-2023',
    //       semester: S.of(context).secondSemester),
    //   WarningData(
    //       warningNumber: '3',
    //       gpa: 1.13,
    //       year: '2023-2024',
    //       semester: S.of(context).firstSemester),
    //   WarningData(
    //       warningNumber: '4',
    //       gpa: 1.26,
    //       year: '2023-2024',
    //       semester: S.of(context).secondSemester),

    // ];


    // class AcademicAlertViewBody1 extends StatelessWidget {
//   final List<WarningData>? warnings;

//   const AcademicAlertViewBody1({super.key, this.warnings});

//   @override
//   Widget build(BuildContext context) {
//     if (warnings == null || warnings!.isEmpty) {
//       return Center(
//         child: Text(S.of(context).noData),
//       );
//     }

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: WarningsTable(warnings: warnings),
//     );
//   }
// }
