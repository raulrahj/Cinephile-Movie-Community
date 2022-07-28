import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/chat_screen/p_chat_screen.dart';
import 'package:open_box/view/profile_screen/post_view_widget.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/widgets/button.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final arg = ModalRoute.of(context)?.settings.arguments as ProfileArg;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: pop(context),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadedState) {
            return SafeArea(
                child: ListView(shrinkWrap: true, children: [
              // kHeight2,
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: Image(
                        color: const Color(0xff0d69ff).withOpacity(1.0),
                        colorBlendMode: BlendMode.softLight,
                        image: const NetworkImage(urlImg1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: SizedBox(
                          height: dHeight(context) * .20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    state.userData!.profilePicture != null
                                        ? NetworkImage(
                                            "$kApiImgUrl/${state.userData!.profilePicture}",
                                            // "$kApiImgUrl/20220714193609452477image_cropper_1657807561088.jpg",
                                          )
                                        : NetworkImage(profImg),
                                radius: 44,
                              ),
                              // kHeight2,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.userData!.firstname,
                                    style: GoogleFonts.oswald()
                                        .copyWith(fontSize: 18, color: kWhite),
                                  ),
                                  Text(
                                    state.userData!.username,
                                    style: TextStyle(
                                        color: kWhite.withOpacity(0.9)),
                                  ),
                                  kHeight1,
                                  Text(
                                    state.userData!.about ?? "bio :)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: kWhite),
                                  )
                                  // Text(arg.)
                                ],
                              ),
                              // kHeight1,

                              // final data = await UserFunc()
                              //     .updateUser(id: "62c148ce68f3b9763ad39e0a");
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        // height: 90,
                        color: kWhite.withOpacity(0.8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: PFCountWidget(
                                count: '0',
                                title: 'Reviewed',
                              ),
                            ),
                            Expanded(
                              child: PFCountWidget(
                                count: state.userData!.following!.length
                                    .toString(),
                                title: 'following',
                              ),
                            ),
                            Expanded(
                              child: PFCountWidget(
                                count: state.userData!.followers!.length
                                    .toString(),
                                title: 'followers',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kHeight1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DButton(
                        isWhite: true,
                        text: "Message",
                        function: () {
                          context
                              .read<ChatCubit>()
                              .findChat(clientId: state.userData!.id);
                          Navigator.pushNamed(context, '/personal_chat',
                              // arguments: PChatArg(
                              //     chatId: 'd', userData: state.userData!)
                                  );
                        },
                      ),
                    ),
                    Expanded(
                      child: DButton(
                        isWhite: false,
                        text: state.isFollowing! ? "Unfollow" : "Follow",
                        function: state.isFollowing!
                            ? () {
                                context.read<UserBloc>().add(
                                      UnFollowUser(id: state.userData!.id),
                                    );
                              }
                            : () {
                                context
                                    .read<UserBloc>()
                                    .add(FollowUser(id: state.userData!.id));
                              },
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                heightFactor: 2,
                child: ShadowText(isWhite: true, data: 'From Recent Reviewed'),
              ),
              FutureBuilder(
                  future: PostRepo().getUserPostes(userId: state.userData!.id),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return PostList(postData: snapshot.data);
                    } else {
                      return const ProgressCircle();
                    }
                  })
              // div,
            ]));
          } else {
            return const ProgressCircle();
          }
        },
      ),
    );
  }
}
