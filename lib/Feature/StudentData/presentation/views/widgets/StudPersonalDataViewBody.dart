import 'package:acdemy/Feature/StudentData/data/Model/personal_info.dart';
import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/Feature/StudentData/presentation/views/widgets/ProfileItem.dart';
import 'package:acdemy/core/helperFunction/Cache_Data.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:acdemy/core/widgets/CustomErrorMessage.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

String getLocalizedText(String? ar, String? en, String languageCode) {
  if (languageCode == 'ar') return ar ?? en ?? '';
  return en ?? ar ?? '';
}

class StudPersonalDataViewBody extends StatefulWidget {
  const StudPersonalDataViewBody({super.key});

  @override
  State<StudPersonalDataViewBody> createState() =>
      _StudPersonalDataViewBodyState();
}

class _StudPersonalDataViewBodyState extends State<StudPersonalDataViewBody> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<PersonalInfoCubit>();
    if (cubit.state is! PersonalInfoSuccess) {
      cubit.getPersonalInfo();
    }
  }

  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      listener: (context, state) {
        if (state is PersonalInfoFailure) {
          CustomErrorMessage(state.error_message);
        }
      },
      builder: (context, state) {
        if (state is PersonalInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: TColor.primaryColor,
            ),
          );
        } else if (state is PersonalInfoSuccess) {
          final PersonalInfo personalInfo = state.personalInfoModel;

          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(2),
                          bottomRight: Radius.circular(2),
                        ),
                        color: TColor.primaryColor),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Personal_Image(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getLocalizedText(
                            getUserPersonalData()!.name.ar,
                            getUserPersonalData()!.name.en,
                            Localizations.localeOf(context).languageCode,
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ProfileItem(
                          icon: Icons.male,
                          label: S.of(context).gender,
                          value: getUserPersonalData()!.gender == "male"
                              ? S.of(context).male
                              : S.of(context).female,
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 8,
                          indent: 3,
                          endIndent: 7,
                        ),
                        ProfileItem(
                            icon: Icons.badge,
                            label: S.of(context).universityId,
                            value: getUserPersonalData()!.universityId),
                        const Divider(
                          color: Colors.white,
                          height: 8,
                          indent: 3,
                          endIndent: 7,
                        ),
                        ProfileItem(
                            icon: Icons.credit_card,
                            label: S.of(context).nationalId,
                            value: getUserPersonalData()!.nationalId),
                        const Divider(
                          color: Colors.white,
                          height: 8,
                          indent: 3,
                          endIndent: 7,
                        ),
                        ProfileItem(
                            icon: Icons.email,
                            label: S.of(context).email,
                            value: getUserPersonalData()!.email),
                        const Divider(
                          color: Colors.white,
                          height: 8,
                          indent: 3,
                          endIndent: 7,
                        ),
                        ProfileItem(
                            icon: Icons.phone,
                            label: S.of(context).phoneNumber,
                            value: getUserPersonalData()!.phone),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(S.of(context).error),
          );
        }
      },
    );
  }
}

class Personal_Image extends StatelessWidget {
  const Personal_Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              width: 90,
              height: 90,
              imageUrl: getUserPersonalData()!.avatar,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
          ),
        ),
      ],
    );
  }
}
