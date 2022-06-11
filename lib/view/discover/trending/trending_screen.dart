import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/discover/trending/trending_card.dart';
import 'package:open_box/view/register/signup_screen.dart';

bool isFull = false;

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LargeHeadlineWidget(title: 'On Trends'),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.6,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4),
          itemCount: 10,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return const TrendingCardW();
          },
        )
      ],
    );
  }
}
