import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Custom_Button_ForgetPassword.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Icon_arow_back.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomTextField.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    String email = "";

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Icon back
                IconArrowBack(
                  text: S.of(context).forgetPassword,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                Text(
                  S.of(context).yourEmail,
                  style: TTextstyle.semiBold16
                      .copyWith(color: TColor.primaryColor),
                ),
                const SizedBox(height: 10),

                // Email Feild 
                CustomTextFormField(
                  isEmail: true,
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      isButtonEnabled = value!.isNotEmpty;
                    });
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: S.of(context).email,
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 30),
                Custom_Button_ForgetPassword(
                  isButtonEnabled: isButtonEnabled,
                  Controller: emailController,
                  text: S.of(context).resetPassword,
                  onPressed: isButtonEnabled
                      ? () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context
                                .read<ForgetPasswordCubit>()
                                .Sendotp(email: email);
                          }
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
