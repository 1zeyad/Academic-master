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


