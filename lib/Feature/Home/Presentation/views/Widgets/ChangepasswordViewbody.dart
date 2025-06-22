import 'package:acdemy/Feature/Home/Data/cubit/changepassword_cubit.dart';
import 'package:acdemy/Feature/Home/Presentation/views/Widgets/Change_password_Field.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangepasswordViewbody extends StatelessWidget {
  ChangepasswordViewbody({super.key});

  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? currentPassword, newpassword, confirmNewpassword;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
        
                // feild Current paswword
                label_text(S.of(context).currentPassword),
                const SizedBox(
                  height: 5,
                ),
                ChangePasswordField(
                  onSaved: (value) {
                    currentPassword = value!;
                  },
                  hintText: S.of(context).enterCurrentPassword,
                ),
                  // feild New Passwword
                const SizedBox(height: 30),
                label_text(S.of(context).newPassword),
                const SizedBox(
                  height: 3,
                ),
        
              
        
                ChangePasswordField(
                    onSaved: (value) {
                      newpassword = value!;
                    },
                    hintText: S.of(context).enterNewPassword),
        
                const SizedBox(height: 30),
                 // feild confirm New Passwword
                label_text(S.of(context).confirmNewPassword),
                const SizedBox(
                  height: 3,
                ),
               
                ChangePasswordField(
                  onSaved: (value) {
                    confirmNewpassword = value!;
                  },
                  hintText: S.of(context).confirmNewPasswordHint,
                ),
                const SizedBox(height: 270),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (newpassword == confirmNewpassword) {
                            context.read<ChangePasswordCubit>().changePassword(
                                oldpassword: currentPassword!,
                                Newpassword: newpassword!);
                          } else {
                            CustomErrorMessage(S.of(context).newPasswordMismatch);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        S.of(context).confirmButton,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget label_text(String text) {
    return Text(
      text,
      style: TTextstyle.bold16.copyWith(color: TColor.primaryColor),
    );
  }
}
