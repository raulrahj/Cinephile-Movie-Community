import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dWidth(context),
      // height: dHeight(context) * .3,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 1,
          )
        ],
      ),
      child: Column(children: children),
    );
  }
}
