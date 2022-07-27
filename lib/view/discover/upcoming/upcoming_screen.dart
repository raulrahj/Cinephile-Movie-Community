import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/view/home/widgets/feed_widget.dart';
// import 'package:open_box/view/discover/youtube.dart';
// import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/l_headline.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(GetAllPost());
    return ListView(
      children: [
        const LargeHeadlineWidget(title: 'Discover'),
        BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is AllPostState) {
              return ListView.builder(
                itemCount: state.listPost!.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return HFeedWdget(
                    postdata: state.listPost![index],
                  );
                },
              );
            } else {
              return const ProgressCircle();
            }
          },
        ),
      ],
    );
  }
}

// Container(
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
//                     width: double.infinity,
//                     height: dHeight(context) / 3,
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                           image: NetworkImage(urlImg1), fit: BoxFit.fill),
//                       color: Colors.black.withOpacity(0.4),
//                       borderRadius: BorderRadius.circular(kRadius),
//                     ),
//                     child: const ProgressCircle(),
//                     //               child: YoutubePlayer(
//                     //   controller: YoutubePlayerController(
//                     //     initialVideoId: 'zn2GwbPG-tc', //Add videoID.
//                     //     flags: const YoutubePlayerFlags(
//                     //       hideControls: false,
//                     //       controlsVisibleAtStart: true,
//                     //       autoPlay: false,
//                     //       mute: false,
//                     //     ),
//                     //   ),
//                     //   showVideoProgressIndicator: true,
//                     //   progressIndicatorColor: kBlack,
//                     // ),
//                   );