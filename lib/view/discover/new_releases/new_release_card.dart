import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/view/discover/movie_detailed.dart';
// import 'package:open_box/view/discover/new_releases/movie_detailed.dart';
import 'package:open_box/view/widgets/l_headline.dart';

class NewReleaseCardW extends StatelessWidget {
  const NewReleaseCardW({
    Key? key,
    required this.data,
  }) : super(key: key);
  final NewReleaseResults data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movie_detailed',
            arguments: MovieArg(isTrending: false,nData: data)
            );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
            width: double.infinity,
            height: dHeight(context) / 3,
            decoration: BoxDecoration(
                // color: Colors.accents[index].withOpacity(0.2),
                image: DecorationImage(
                    image: NetworkImage(
                        "$kImgHost/${data.backdropPath}"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(kRadius)),
          ),
          Positioned(
            right: 19,
            top: 15,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius))),
              child: const Text('Book Now'),
            ),
          ),
          Positioned(bottom: 5, child: LargeHeadlineWidget(title: data.title!)),
          Positioned(
            bottom: 39,
            left: 21,
            child: Text(
              '12 MAY',
              style: GoogleFonts.oswald()
                  .copyWith(color: Theme.of(context).iconTheme.color),
            ),
          )
        ],
      ),
    );
  }
}
