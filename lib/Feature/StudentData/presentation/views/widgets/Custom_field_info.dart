// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/CustomTermGrades.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

class Custom_Field_info extends StatelessWidget {
  const Custom_Field_info({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final String text;
  final void Function() onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        
      
        child: Container(
          color: Colors.grey.shade100,
          width: double.infinity,
          height: 43,
          child: Row(
            children: [
            
              icon,
             const  SizedBox(
              
                width: 3,
              ),
              Text(
                text,
                style: TTextstyle.semiBold14.copyWith(color: TColor.primaryColor),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
