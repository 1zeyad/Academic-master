import 'package:acdemy/Feature/Auth/Data/cubit/user_login_cubit.dart';
import 'package:acdemy/Feature/Auth/Data/repos/repo_impl.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Student_Login_View_Body.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/CustomButtonNavigation_Bar.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StudentLoginView extends StatelessWidget {
  const StudentLoginView({Key? key, this.groupValue = 'Student'})
      : super(key: key);
  final String? groupValue;

  static const String routename = '/Student';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(
          authrepo: AuthRepoImpl(apiServices: DioConsumer(dio: Dio()))),
      child: BlocConsumer<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccess) {
            CustomErrorMessage(S.of(context).loginSuccess);
            GoRouter.of(context).push(CustomButtonNavigationBar.routeName);
          } else if (state is UserLoginFailure) {
            CustomErrorMessage(state.error_message);
          }
        },
        builder: (context, state) {
          return CustomCircleIndicator(
            inAsyncCall: state is UserLoginLoading ? true : false,
            child: const Scaffold(
              body: StudentloginViewBody(),
            ),
          );
        },
      ),
    );
  }
}
