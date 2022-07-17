import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/widgets/common.dart';

class MovieArg {
  final Result? data;
  final bool isTrending;
  final NewReleaseResults? nData;
  MovieArg({this.nData, this.data, required this.isTrending});
}

bool isTrendData = true;

class MovieDetailed extends StatelessWidget {
  const MovieDetailed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as MovieArg;
    final nData = ModalRoute.of(context)!.settings.arguments as MovieArg;
    if (data != null) {
      isTrendData = true;
    } else if (nData != null) {
      isTrendData = false;
    }
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
                  icon: const Icon(Icons.location_on))
            ],
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: dHeight(context) / 3,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.4,
              title: RichText(
                text: TextSpan(
                    text:
                        data.data!.originalTitle.toString(),
                    style: GoogleFonts.oswald().copyWith(fontSize: 22),
                    children: [
                      const TextSpan(text: '  '),
                      TextSpan(
                          text: '(2002)',
                          style: GoogleFonts.dmSans()
                              .copyWith(fontSize: 17, color: kWhite))
                    ]),
              ),
              background: Image(
                image: NetworkImage(
                  "$kImgHost/${data.data!.backdropPath}",
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
                  SizedBox(
                    height: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        RateDisplay(),
                        RateDisplay(),
                        RateDisplay(),
                      ],
                    ),
                  ),
                  div,
                  LimitedBox(
                    maxHeight: 45,
                    maxWidth: double.infinity,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
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
                              'Action',
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
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data.data!.overview ?? lorem,
                      style: TextStyle(height: 1.4),
                    ),
                  ),
                  div,
                  const HeadlineWidget(
                    title: 'Cast',
                    color: kBlack,
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
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(profImg), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(kRadius),
                            color: Colors.black87,
                          ),
                        );
                      },
                    ),
                  ),
                  div,
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HeadlineWidget(
                          title: "Watch on",
                          color: kBlack,
                        ),
                        Center(child: Icon(Icons.live_tv_rounded)),
                        kHeight2
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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
