import 'package:flutter/material.dart';
import 'package:open_box/view/discover/new_releases/new_release_card.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/l_headline.dart';

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
              return const NewReleaseCardW();
            })
      ],
    );
  }
}
