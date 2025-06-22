import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/ProfileItem.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:flutter/material.dart';

class AcademicInfoDetails extends StatelessWidget {
  final AcademicInfo academicInfo;

  const AcademicInfoDetails({super.key, required this.academicInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          ProfileItem(
            icon: Icons.account_balance,
            label: S.of(context).level,
            value: academicInfo.level,
          ),
          const Divider(height: 8, indent: 3, endIndent: 7),
          ProfileItem(
            icon: Icons.calendar_month,
            label: S.of(context).field,
            value: academicInfo.gainedHours < 60
                ? S.of(context).general
                : S.of(context).cs,
          ),
          const Divider(height: 8, indent: 3, endIndent: 7),
          ProfileItem(
            icon: Icons.account_balance,
            label: S.of(context).attemptedHours,
            value: academicInfo.attemptedHours,
          ),
          const Divider(height: 8, indent: 3, endIndent: 7),
          ProfileItem(
            icon: Icons.account_balance,
            label: S.of(context).gainedHours,
            value: academicInfo.gainedHours,
          ),
          const Divider(height: 8, indent: 3, endIndent: 7),
          ProfileItem(
            icon: Icons.account_tree_outlined,
            label: S.of(context).gpa,
            value: academicInfo.gpa,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
