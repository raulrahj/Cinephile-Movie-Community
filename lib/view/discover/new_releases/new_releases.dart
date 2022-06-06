import 'package:flutter/material.dart';
import 'package:open_box/view/register/signup_screen.dart';

class NewReleaseScreen extends StatelessWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LargeHeadlineWidget(title: 'New Releases'),
      ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,index){
        return Container();
      })
    ],);
  }
}