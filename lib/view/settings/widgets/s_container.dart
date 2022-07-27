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
      margin: const EdgeInsets.only(bottom: 10, left: 10,right: 10),
      padding: const EdgeInsets.symmetric(vertical:8),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: [
            BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        offset: const Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
          
        ],
      ),
      child: Column(children: children),
    );
  }
}
