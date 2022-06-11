import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class HCardWidget extends StatelessWidget {
  const HCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: dWidth(context) / 3.8,
      height: dHeight(context) / 4.9,
      decoration: BoxDecoration(
          image:
           const  DecorationImage(image: NetworkImage(profImg1), fit: BoxFit.fill),
          color: kBlack,
          borderRadius: BorderRadius.circular(kRadius)),
    );
  }
}
