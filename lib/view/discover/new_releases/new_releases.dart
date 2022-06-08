import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/register/signup_screen.dart';

class NewReleaseScreen extends StatelessWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LargeHeadlineWidget(title: 'New Releases'),
        ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                width: double.infinity,
                height: dHeight(context) / 3,
                decoration: BoxDecoration(
                    color: Colors.accents[index].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(kRadius)),
              );
            })
      ],
    );
  }
}
