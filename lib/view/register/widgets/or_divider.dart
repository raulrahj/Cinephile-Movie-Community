
import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [KDivider(), Text('  OR  ',style: TextStyle(color: kWhite),), KDivider()],
      ),
    );
  }
}

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 1,
        width: dWidth(context) * .4,
        color: Colors.grey,
      ),
    );
  }
}
