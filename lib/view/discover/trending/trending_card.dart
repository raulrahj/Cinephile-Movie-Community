import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/view/discover/movie_detailed.dart';

class TrendingCardW extends StatelessWidget {
  const TrendingCardW({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Result data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/movie_detailed',
          arguments: MovieArg(data: data, isTrending: true)),
      child: SizedBox(
        child:
            // data.isLoading?const Center(child:  CircularProgressIndicator()):
            Stack(
          children: [
           
            Container(
              margin: const EdgeInsets.all(3),
              width: dWidth(context) / 3.8,
              height: dHeight(context) / 4.9,
              // height: dHeight(context) / 3.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                image: DecorationImage(image: NetworkImage(
                 
                    "$kImgHost${data.posterPath}"), fit: BoxFit.cover),
              ),
            ),
            //   },
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                // width: dWidth(context),
                width: dWidth(context) / 3.7,

                decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.55),
                    boxShadow: const [
                      BoxShadow(blurRadius: 2, spreadRadius: -5, color: kWhite)
                    ]),
                height: 25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Expanded(
                    child: Center(
                      child: Text(
                        data.title ?? 'Inceptions',
                        style: GoogleFonts.oswald().copyWith(
                            fontWeight: FontWeight.w300,
                            color: kBlack,
                            fontSize: 12),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        //   );
        // },
      ),
    );
  }
}
