import 'package:acdemy/Feature/StudentData/presentation/views/widgets/StudPersonalDataViewBody.dart';
import 'package:flutter/material.dart';


class StudPersonalDataView extends StatelessWidget {
  const StudPersonalDataView({super.key});

  @override
  static const routeName = '/StudPersonalDataView';
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StudPersonalDataViewBody(),
    );
  }
}
