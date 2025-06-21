
import 'package:acdemy/core/utiles/app_color.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    Key? key,
   
    required this.child,
    required this.inAsyncCall,
  }) : super(key: key);

  final Widget? child;
  final bool inAsyncCall;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            TColor.primaryColor), //  تغيير اللون  هنا
      ),
      color: TColor.primaryColor,
      inAsyncCall:inAsyncCall,
      child:child!
    );
  }
}