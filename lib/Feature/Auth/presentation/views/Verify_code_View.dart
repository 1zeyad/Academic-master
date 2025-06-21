import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/New_Password_view.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Verify_code_ViewBody.dart';
import 'package:acdemy/core/widgets/CustomCircle_indicator.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  static const String routeName = '/VerifyCodeView';
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is CodeVerifecationFailure) {
            CustomErrorMessage(S.of(context).verificationFailed);
          } else if (state is CodeVerifecationSuccess) {
            CustomErrorMessage(S.of(context).verificationSuccess);
            GoRouter.of(context).push(NewPasswordView.routeName);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: CustomCircleIndicator(
                inAsyncCall: state is CodeVerifecationLoading ? true : false,
                child: VerifyCodeViewbody()),
          );
        },
      ),
    );
  }
}
