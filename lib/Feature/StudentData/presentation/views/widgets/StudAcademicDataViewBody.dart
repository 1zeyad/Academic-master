import 'package:acdemy/Feature/Home/Presentation/views/Widgets/GraduationInfo.dart';
import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/academic_info_cubit.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/ProfileItem.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudAcademicDataViewBody extends StatefulWidget {
  const StudAcademicDataViewBody({super.key});

  @override
  State<StudAcademicDataViewBody> createState() =>
      _StudAcademicDataViewBodyState();
}

class _StudAcademicDataViewBodyState extends State<StudAcademicDataViewBody> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<AcademicInfoCubit>();
    if (cubit.state is! AcademicInfoSuccess) {
      cubit.getAcademicInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcademicInfoCubit, AcademicInfoState>(
      listener: (context, state) {
        if (state is AcademicInfoFailure) {
          CustomErrorMessage(state.error_message);
        }
      },
      builder: (context, state) {
        if (state is AcademicInfoLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: TColor.primaryColor,
          ));
        } else if (state is AcademicInfoSuccess) {
          final academicInfo = state.academicInfoModel;

          final int completedHours = academicInfo.gainedHours;
          final int totalHours =
              academicInfo.regulation.academicRequirements.regulationHours;
          double progress = completedHours / totalHours;
          int remainingHours = totalHours - completedHours;

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                AcademicInfoDetails(academicInfo: academicInfo),
                const SizedBox(height: 70),
                GraduationInfo(
                    progress: progress, remainingHours: remainingHours),
              ],
            ),
          );
        } else {
          return Center(child: Text(S.of(context).noData));
        }
      },
    );
  }
}

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
