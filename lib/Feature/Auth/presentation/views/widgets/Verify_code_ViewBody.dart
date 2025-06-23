import 'package:acdemy/Feature/Auth/Data/cubit/forget_password_cubit.dart';
import 'package:acdemy/Feature/Auth/presentation/views/New_Password_view.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Custom_Button_ForgetPassword.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/Icon_arow_back.dart';
import 'package:acdemy/Feature/Auth/presentation/views/widgets/New_Password_View_Body.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeViewbody extends StatefulWidget {
  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeViewbody> {
  TextEditingController pinController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          IconArrowBack(
            text: S.of(context).codeVerification,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            S.of(context).enter4DigitCode,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Pin Code Feild
          PinCodeTextField(
            appContext: context,
            length: 4,
            controller: pinController,
            autoDismissKeyboard: true,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: TColor.lightPrimaryColor3,
              inactiveColor: Colors.grey,
              selectedColor: Colors.black,
            ),
            onChanged: (value) {
              setState(() {
                isButtonEnabled = value.length == 4;
              });
            },
          ),
          const SizedBox(height: 20),
          Custom_Button_ForgetPassword(
              onPressed: isButtonEnabled
                  ? () {
                      CacheHelper.saveData(
                          key: Keys.otp, value: pinController.text.trim());
                      context
                          .read<ForgetPasswordCubit>()
                          .verifyotp(otp: pinController.text.trim());
                    }
                  : null,
              text: S.of(context).verifyCode,
              isButtonEnabled: isButtonEnabled,
              Controller: pinController),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              S.of(context).resendEmail,
              style: TTextstyle.bold16.copyWith(color: TColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
