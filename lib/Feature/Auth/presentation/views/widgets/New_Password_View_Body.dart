import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Custom_Button_ForgetPassword.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Icon_arow_back.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomPaswordField.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Icon back
          IconArrowBack_NewPassword(
              text: S.of(context).newPassword,
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.14),
            Text(
              S.of(context).password,
              style: TTextstyle.semiBold14.copyWith(color: TColor.primaryColor),
            ),
            const SizedBox(height: 10),
            // password feild 
            CustomPaswordFeild(
              controller: passwordController,
              hintText: S.of(context).password,
              onChanged: (_) {
                setState(() {
                  isButtonEnabled =
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty;
                });
              },
            ),

            const SizedBox(height: 30),
            Text(
              S.of(context).confirmPassword,
              style: TTextstyle.semiBold14.copyWith(color: TColor.primaryColor),
            ),
            const SizedBox(height: 10),

             // confirmPassword
            CustomPaswordFeild(
              controller: confirmPasswordController,
              hintText: S.of(context).reEnterPassword,
              onChanged: (_) {
                setState(() {
                  isButtonEnabled =
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty;
                });
              },
            ),

            const SizedBox(height: 30),
               // reset password button
               
            Custom_Button_ForgetPassword(
              onPressed: isButtonEnabled
                  ? () {
                      if (formKey.currentState!.validate()) {
                        if (passwordController.text == confirmPasswordController.text) {
                          context.read<ForgetPasswordCubit>().resetPassword(
                                password: confirmPasswordController.text,
                              );
                        } else {
                          CustomErrorMessage(S.of(context).passwordsDoNotMatch);
                        }
                      }
                    }
                  : null,
              isButtonEnabled: isButtonEnabled,
              Controller: confirmPasswordController,
              text: S.of(context).resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
