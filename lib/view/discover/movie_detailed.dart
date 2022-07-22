import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/logic/cubit/search/search_cubit.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/search_screen/movie_search/s_review.dart';
import 'package:open_box/view/widgets/common.dart';

class MovieArg {
  final String? title;
  final String? image;
  final List<int>? genreList;
  final String? overview;
  final int? id;

  // final Result? data;
  // final bool isTrending;
  // final NewReleaseResults? nData;
  MovieArg({
    this.title,
    this.image,
    this.genreList,
    this.overview,
    this.id,
    // this.nData,
    // this.data,
    // required this.isTrending
  });
}

bool isTrendData = true;

class MovieDetailed extends StatelessWidget {
  const MovieDetailed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(genreFind([23, 28]));
    final data = ModalRoute.of(context)?.settings.arguments as MovieArg;
    // final nData = ModalRoute.of(context)?.settings.arguments as MovieArg;
    final genres = genreFind(data.genreList!);
    // if (data != null) {
    //   isTrendData = true;
    // } else if (nData != null) {
    //   isTrendData = false;
    // }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: pop(context),
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/nearby_theatre'),
                icon: const Icon(Icons.location_on),
              )
            ],
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: dHeight(context) / 3,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.4,
              title: RichText(
                text: TextSpan(
                  text: data.title.toString(),
                  style: GoogleFonts.oswald().copyWith(fontSize: 22),
                  children: [
                    const TextSpan(text: '  '),
                    TextSpan(
                      text:
                          // ParseDate.dFormatDate(data.data!.releaseDate) ??
                          '(2002)',
                      style: GoogleFonts.dmSans()
                          .copyWith(fontSize: 17, color: kWhite),
                    )
                  ],
                ),
              ),
              background: Image(
                image: NetworkImage(
                  "$kImgHost/${data.image}",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SliverList(delegate: SliverChildDelegate()

          // )
          SliverFillRemaining(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                // shrinkWrap: true,
                children: [
                  // SizedBox(
                  //   height: 75,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: const [
                  //       // RateDisplay(),
                  //       // RateDisplay(),
                  //       // RateDisplay(),
                  //     ],
                  //   ),
                  // ),
                  div,
                  LimitedBox(
                    maxHeight: 45,
                    maxWidth: double.infinity,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          final genre = genres[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     spreadRadius: 1,color: Colors.grey,blurRadius: 2
                              //   )
                              // ],
                              color: Colors.black.withOpacity(0.8),
                              // border: Border.all(color: Colors.grey.withOpacity(0.8)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              genre ?? 'Action',
                              style:
                                  GoogleFonts.dmSans().copyWith(color: kWhite),
                            ),
                          );
                        }),
                  ),
                  div,
                  const HeadlineWidget(
                    title: 'Overview',
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data.overview ?? lorem,
                      style: const TextStyle(height: 1.4),
                    ),
                  ),
                  div,
                  GestureDetector(
                    child: const HeadlineWidget(
                      title: 'Reviews',
                      color: kBlack,
                    ),
                    onTap: () {
                      context.read<SearchCubit>().getReview(movieId: data.id!);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReviewScreen()));
                    },
                  ),
                  LimitedBox(
                    maxHeight: 180,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          width: dWidth(context) / 3,
                          // decoration: BoxDecoration(
                          //   image: const DecorationImage(
                          //       image: NetworkImage(profImg), fit: BoxFit.fill),
                          //   borderRadius: BorderRadius.circular(kRadius),
                          //   color: Colors.black87,
                          // ),
                        );
                      },
                    ),
                  ),
                  div,
                  // SizedBox(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: const [
                  //       HeadlineWidget(
                  //         title: "Watch on",
                  //         color: kBlack,
                  //       ),
                  //       Center(child: Icon(Icons.live_tv_rounded)),
                  //       kHeight2
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<String> genreFind(List<int> genre) {
    List<String>? genres = [];
    for (int i = 0; i < genre.length; i++) {
      if (genre[i] == 28) {
        genres.add("Action");
      }
      if (genre[i] == 12) {
        genres.add("Adventure");
      }
      if (genre[i] == 16) {
        genres.add("Animation");
      }
      if (genre[i] == 35) {
        genres.add("Comedy");
      }
      if (genre[i] == 80) {
        genres.add("Crime");
      }
      if (genre[i] == 99) {
        genres.add("Documentary");
      }
      if (genre[i] == 18) {
        genres.add("Drama");
      }
      if (genre[i] == 10751) {
        genres.add("Family");
      }
      if (genre[i] == 14) {
        genres.add("Fantasy");
      }
      if (genre[i] == 36) {
        genres.add("History");
      }
      if (genre[i] == 27) {
        genres.add("Horror");
      }
      if (genre[i] == 10402) {
        genres.add("Music");
      }
      if (genre[i] == 9648) {
        genres.add("Mystery");
      }
      if (genre[i] == 10749) {
        genres.add("Romance");
      }
      if (genre[i] == 878) {
        genres.add("Science Fiction");
      }
      if (genre[i] == 10770) {
        genres.add("TV Movie");
      }
      if (genre[i] == 53) {
        genres.add("TV Thirller");
      }
      if (genre[i] == 10752) {
        genres.add("TV War");
      }
      if (genre[i] == 37) {
        genres.add("Western");
      }
    }
    return genres;
  }
}

class RateDisplay extends StatelessWidget {
  const RateDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 9),
          width: 50,
          height: 50,
          color: kBlack,
          // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(urlImg))),
        ),
        const Text('****')
      ],
    );
  }
}
