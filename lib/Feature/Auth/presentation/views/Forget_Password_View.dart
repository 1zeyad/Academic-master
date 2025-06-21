import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/Verify_code_View.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Forget_password_view_Body.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Verify_code_ViewBody.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  static const String routeName = '/ForgetPasswordView';
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordFailure) {
            CustomErrorMessage(S.of(context).forgetPasswordError);
          } else if (state is ForgetPasswordSuccess) {
            CustomErrorMessage(S.of(context).forgetPasswordSuccess);
            GoRouter.of(context).push(VerifyCodeView.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: CustomCircleIndicator(
                inAsyncCall: state is ForgetPasswordLoading ? true : false,
                child: ForgetPasswordViewBody()),
          );
        },
      ),
    );
  }
}
