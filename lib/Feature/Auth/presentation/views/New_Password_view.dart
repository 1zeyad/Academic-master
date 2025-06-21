import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/StudentLoginView.dart';
import 'package:acdemy/Feature/Auth/presentation/views/Verify_code_View.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/New_Password_View_Body.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  static const String routeName = '/NewPassword';
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordFailure) {
            CustomErrorMessage(S.of(context).resetPasswordError);
          } else if (state is ResetPasswordSuccess) {
            CustomErrorMessage(S.of(context).resetPasswordSuccess);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: CustomCircleIndicator(
                inAsyncCall: state is ResetPasswordLoading ? true : false,
                child: const NewPasswordViewBody()),
          );
        },
      ),
    );
  }
}

  //  

 