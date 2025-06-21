import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/Repo/WarningsRepo_Impl.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/cubit/warnings_cubit.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Presentation/Views/Widgets/AcademicAlertViewBody.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicAlertView extends StatelessWidget {
  const AcademicAlertView({super.key});

  @override
  static const String routename = '/AcademicAlert';

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>WarningsCubit(warningsRepoImpl: WarningsrepoImpl(apiServices: DioConsumer(dio: Dio())))..getWarnings(),
      child: Scaffold(
        appBar:
            Custom_App_Bar(text: S.of(context).academicAlert, context: context),
        body: const AcademicAlertViewBody(),
      ),
    );
  }
}
