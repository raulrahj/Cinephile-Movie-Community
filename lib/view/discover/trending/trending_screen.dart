import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/register/signup_screen.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const LargeHeadlineWidget(title: 'Trending Now'),
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),       itemBuilder: (
          
          context,index){
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 4),
          width: double.infinity,
        height: dHeight(context)/4.4,
        decoration: BoxDecoration(color: Colors.accents[index],
        borderRadius: BorderRadius.circular(kRadius)),);
      })
    ],);
  }
}