import 'package:acdemy/Feature/plans&Regulations/Data/Repo/repo_Regulation&plan_impl.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/cubit/regulation_cubit.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/widgets/RegulationViewBody.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/core/helperFunction/inside_AppBar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Regulationview extends StatelessWidget {
  const Regulationview({super.key});

  @override
  static const routeName = '/Regulationview';
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegulationCubit(repo4: RepoImpl4(apiService: DioConsumer(dio: Dio())))
            ..getRegulation(),
      child: Scaffold(
        appBar:
            Custom_App_Bar(text: S.of(context).regulation, context: context),
        body: const RegulationViewBody(),
      ),
    );
  }
}


// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: DropdownButton2<String>(
          
//           isExpanded: true,
//           underline: Container(), // لإزالة الخط اللي تحت
//           hint: const Text("Select Section"),
//           items: ['Option 1', 'Option 2']
//               .map((item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item),
//                   ))
//               .toList(),
//           onChanged: (value) {
//             // handle value
//           },
//           buttonStyleData: ButtonStyleData(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey),
//               color: Colors.white,
//             ),
//           ),
//           dropdownStyleData: DropdownStyleData(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 5,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//           ),
//         ),
      
//     );
//   }
// }