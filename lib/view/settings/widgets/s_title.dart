
import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/view/register/otp_verification.dart';

class SettingsTitleWidget extends StatelessWidget {
  const SettingsTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: dHeight(context) / 21,
      color: Theme.of(context).primaryColorLight,
      child: HeadlineWidget(
        title: title,
        color: kBlack,
      ),
    );
  }
}
