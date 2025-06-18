import 'package:acdemy/Feature/plans&Regulations/Data/Repo/repo_Regulation&plan_impl.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/cubit/plan_cubit.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/plans&Regulations/presentation/views/widgets/PlanViewBody.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/core/helperFunction/inside_AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  static const String routeName = '/PlanView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PlanCubit(repo4: RepoImpl4(apiService: DioConsumer(dio: Dio())))
            ..getMyPlans(),
      child: Scaffold(
        appBar: Custom_App_Bar(text: S.of(context).plans, context: context),
        body: PlanViewBody(),
      ),
    );
  }
}
