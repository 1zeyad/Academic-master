import 'package:flutter/material.dart';
import 'package:acdemy/generated/l10n.dart';

class Academictranningviewbody extends StatelessWidget {
  const Academictranningviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).noData),
    );
  }
}
