// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:open_box/view/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => None,
      itemCount: 10,
      itemBuilder: (context, index) {
      return Row(children: [
        const CircleAvatar(),RichText(text: const TextSpan(text: 'Username',children: [
          TextSpan(text: 'notification'),
        ]),),
        const Spacer(),
          const Text('time')
      ]);
    });
  }
}
