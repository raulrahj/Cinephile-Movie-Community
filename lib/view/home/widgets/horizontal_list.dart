
import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/view/discover/trending/trending_card.dart';
import 'package:open_box/view/home/widgets/h_card_widget.dart';

class HhorizontalWidget extends StatelessWidget {
  const HhorizontalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: double.infinity,
      maxHeight: dHeight(context) / 4.9,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return const TrendingCardW();
        },
      ),
    );
  }
}
