import 'package:acdemy/Feature/StudentData/data/cubit/personal_info_cubit.dart';
import 'package:acdemy/core/helperFunction/Cache_Data.dart';
import 'package:acdemy/generated/l10n.dart';
import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class InfoPersonal extends StatelessWidget {
  const InfoPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        if (state is PersonalInfoLoading) {
          return SizedBox(
            height: 80, // نفس ارتفاع الـ Card اللي هيظهر بعدين
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      radius: 3, // دائرة صغيرة جداً
                      backgroundColor: Colors.grey[400],
                    ),
                  );
                }),
              ),
            ),
          );
        } else if (state is PersonalInfoFailure) {
          return Text("Error ${state.error_message}");
        } else if (state is PersonalInfoSuccess) {
          final user = state.personalInfoModel;

          final userName = Localizations.localeOf(context).languageCode == 'ar'
              ? user.name.ar
              : user.name.en;

          return Card(
            elevation: 3,
            shadowColor: Colors.white,
            color: Colors.white,
            child: ListTile(
              title: Text(
                S.of(context).welcomeBack,
                style: TTextstyle.normal16,
              ),
              subtitle: Text(
                userName,
                style: TTextstyle.bold16,
              ),
              leading: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: user.avatar,
                    placeholder: (context, url) => Shimmer.fromColors(
                      child: Container(
                          width: 100, height: 100, color: Colors.white),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox(); // حالة initial أو غير متوقعة
      },
    );
  }
}
