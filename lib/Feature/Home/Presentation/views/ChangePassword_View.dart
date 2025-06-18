import 'package:acdemy/Feature/Home/Data/Repos/Repo_Impl.dart';
import 'package:acdemy/Feature/Home/Data/cubit/changepassword_cubit.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/ChangepasswordViewbody.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangepasswordView extends StatelessWidget {
  const ChangepasswordView({super.key});

  @override
  static const String routename = '/UpdatepasswordView';
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
          homeRepo: HomeRepoImpl(apiService: DioConsumer(dio: Dio()))),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: TColor.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              S.of(context).changePassword,
              style: TTextstyle.bold19.copyWith(color: Colors.white),
            ),
          ),
        ),
        body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordFailure) {
              CustomErrorMessage(state.errorMessage);
            }
            if (state is ChangePasswordSuccess) {
              CustomErrorMessage(state.message);
              Future.delayed(const Duration(seconds: 1), () {
                GoRouter.of(context).pop();
              });
            }
          },
          builder: (context, state) {
            return CustomCircleIndicator(
                inAsyncCall: state is ChangePasswordLoading ? true : false,
                child: ChangepasswordViewbody());
          },
        ),
      ),
    );
  }
}
