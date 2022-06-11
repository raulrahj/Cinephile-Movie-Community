import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class TrendingCardW extends StatelessWidget {
  const TrendingCardW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/new_release_detailed'),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
            width: double.infinity,
            // height: dHeight(context) / 3.4,
            decoration: BoxDecoration(
                // color: Colors.accents[index],
                borderRadius: BorderRadius.circular(kRadius),
                image: const DecorationImage(
                    image: NetworkImage(urlImg1), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.centerLeft,
              width: dWidth(context),
              decoration: BoxDecoration(
                  color: kWhite.withOpacity(0.55),
                  boxShadow: const [
                    BoxShadow(blurRadius: 2, spreadRadius: -5, color: kWhite)
                  ]),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  kWidth1,
                  Text(
                    'Inceptions',
                    style: GoogleFonts.oswald()
                        .copyWith(fontWeight: FontWeight.bold, color: kBlack),
                  ),
                  kWidth1,
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.live_tv_rounded,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
