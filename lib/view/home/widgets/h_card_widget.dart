import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/view/discover/widgets/movie_detailed.dart';

class HCardWidget extends StatelessWidget {
  const HCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Result data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/movie_detailed',
          arguments: MovieArg(
              image: data.backdropPath,
              title: data.originalName ?? data.originalTitle,
              overview: data.overview,
              genreList: data.genreIds,
              id: data.id)),
      child: SizedBox(
        child:
            // data.isLoading?const Center(child:  CircularProglsressIndicator()):
            Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(3),
              width: dWidth(context) / 3.8,
              height: dHeight(context) / 4.9,
              // height: dHeight(context) / 3.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                image: DecorationImage(
                    image: NetworkImage("$kImgHost${data.posterPath}"),
                    fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                    top: 2, bottom: 2, left: dHeight(context) / 31),
                alignment: Alignment.center,
                // width: dWidth(context),
                width: dWidth(context) / 3.7,

                decoration:
                    BoxDecoration(color: kWhite.withOpacity(0.55), boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: -5,
                    color: kWhite.withOpacity(0.6),
                  )
                ]),
                height: 30,
                child: OverflowBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.title ?? "Unknown",
                    style: GoogleFonts.dmSans().copyWith(
                        // fontWeight: FontWeight.w500,
                        color: kBlack,
                        fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
