import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
// import 'package:open_box/view/discover/youtube.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/l_headline.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LargeHeadlineWidget(title: 'Upcoming Movies'),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              width: double.infinity,
              height: dHeight(context) / 3,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(urlImg1), fit: BoxFit.fill),
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: const ProgressCircle(),
//               child: YoutubePlayer(
//   controller: YoutubePlayerController(
//     initialVideoId: 'zn2GwbPG-tc', //Add videoID.
//     flags: const YoutubePlayerFlags(
//       hideControls: false,
//       controlsVisibleAtStart: true,
//       autoPlay: false,
//       mute: false,
//     ),
//   ),
//   showVideoProgressIndicator: true,
//   progressIndicatorColor: kBlack,
// ),
            );
          },
        ),
      ],
    );
  }
}
