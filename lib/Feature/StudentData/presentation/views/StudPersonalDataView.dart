import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo_impl.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/StudPersonalDataViewBody.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helperFunction/AppBar.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudPersonalDataView extends StatelessWidget {
  const StudPersonalDataView({super.key});

  @override
  static const routeName = '/StudPersonalDataView';
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StudPersonalDataViewBody(),
    );
  }
}
