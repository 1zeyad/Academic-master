import 'package:acdemy/Feature/Auth/Data/cubit/user_login_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/Forget_Password_View.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/utiles/assets.dart';
import 'package:acdemy/core/widgets/CustomButton.dart';
import 'package:acdemy/core/widgets/CustomPaswordField.dart';
import 'package:acdemy/core/widgets/CustomTextField.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StudentloginViewBody extends StatefulWidget {
  const StudentloginViewBody({super.key});

  @override
  State<StudentloginViewBody> createState() => _StudentloginViewBodyState();
}

class _StudentloginViewBodyState extends State<StudentloginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image Login
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, top: 40),
                    child: Image.asset(
                      Assets.ImageLogin,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  S.of(context).email,
                  style: const TextStyle(
                    color: TColor.primaryColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),

                // email text field
                CustomTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: S.of(context).email,
                  prefixIcon: const Icon(Icons.person),
                  isEmail: true,
                ),
                const SizedBox(height: 16),

                Text(
                  S.of(context).password,
                  style: const TextStyle(
                    color: TColor.primaryColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),

                // pasword text field
                CustomPaswordFeild(
                  hintText: S.of(context).password,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(ForgetPasswordView.routeName);
                    },
                    child: Text(
                      S.of(context).forgetPasswordQ,
                      style: TTextstyle.semiBold16.copyWith(
                        color: TColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                Center(
                  child: Custombutton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        context.read<UserLoginCubit>().LoginUser(
                              email: email,
                              password: password,
                            );
                      }
                    },
                    text: S.of(context).login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
