import 'package:flutter/material.dart';
// import 'package:acdemy/generated/l10n.dart';

class test_app extends StatelessWidget {
  const test_app({super.key});
  static const routname = 'MyApp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        // home: const GradesScreen(),
        );
  }
}

// class GradesScreen extends StatelessWidget {
//   const GradesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("S.of(context).studentGrades"),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildSemesterSection(S.of(context).fall, "2024-2025", fallCourses),
//             buildSemesterSection(S.of(context).summer, "2023-2024", summerCourses),

//         ),
//       ),
//     );
//   }
