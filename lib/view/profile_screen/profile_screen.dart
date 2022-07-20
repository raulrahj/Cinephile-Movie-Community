import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/post_view.dart';
import 'package:open_box/view/profile_screen/profile_edit.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class ProfileArg {
  final UserModel? user;
  // final ProfileModel? loginUser;
  final bool isProfile;
  ProfileArg({required this.isProfile, this.user});
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as ProfileArg;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: pop(context),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is CurrentUserState) {
            return SafeArea(
                child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
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
                                  backgroundImage: NetworkImage(
                                      "$kApiImgUrl/${state.profileData!.user!.profilePicture}"),
                                  radius: 44,
                                ),
                                // kHeight2,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.profileData!.user!.firstname,
                                      style: GoogleFonts.oswald().copyWith(
                                          fontSize: 18, color: kWhite),
                                    ),
                                    Text(
                                      state.profileData!.user!.username,
                                      style: TextStyle(
                                          color: kWhite.withOpacity(0.9)),
                                    ),
                                    kHeight1,
                                    Text(
                                      state.profileData!.user!.about ??
                                          "bio :)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: kWhite),
                                    )
                                    // Text(arg.)
                                  ],
                                ),
                                // kHeight1,
                                arg.isProfile
                                    ? ActionChip(
                                        label: const Text('edit profile'),
                                        onPressed: () async {
                                          final data = await SharedService
                                                  .getUserProfile()
                                              .then((data) {
                                            Navigator.pushNamed(
                                                context, '/profile_edit',
                                                arguments:
                                                    ProfileEditArg(data!));
                                          });
                                          // final data = await UserFunc()
                                          //     .updateUser(id: "62c148ce68f3b9763ad39e0a");
                                        })
                                    : ActionChip(
                                        label: const Text('follow'),
                                        onPressed: () {})
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
                                  count: state
                                      .profileData!.user!.following!.length
                                      .toString(),
                                  title: 'following',
                                ),
                              ),
                              Expanded(
                                child: PFCountWidget(
                                  count: state
                                      .profileData!.user!.followers!.length
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
                FutureBuilder(
                    future: PostRepo().getUserPostes(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          // crossAxisCount: 2,
                          // ),

                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Post data = snapshot.data[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostView(
                                              data: data,
                                            )));
                                print(data.id.toString());
                              },
                              child: Container(
                                height: dHeight(context) * .10,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),

                                // height: 100,
                                width: dWidth(context),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image(
                                        image: NetworkImage(
                                            "$kApiImgUrl/${data.image}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    kWidth1,
                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              data.desc ?? lorem,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            Text(
                                              dateFormat(data.createdAt),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(color: Colors.grey),
                                            )
                                          ],
                                        )),
                                    // Expanded(
                                    //     flex: 1,
                                    //     child: Row(
                                    //       children: const [
                                    //         Icon(Icons.whatshot),
                                    //         Text('234')
                                    //       ],
                                    //     ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const AspectRatio(
                            aspectRatio: 3 / 2, child: ProgressCircle());
                      }
                    })
              ],
            ));
          } else {
            return const ProgressCircle();
          }
        },
      ),
    );
  }
}

class PFCountWidget extends StatelessWidget {
  const PFCountWidget({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);
  final String count;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dWidth(context) / 2.2,
      height: dHeight(context) * .09,
      // color: Colors.accents[5],
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(title),
        // kHeight1,
        Text(
          count,
          style: Theme.of(context).textTheme.headline6,
        )
      ]),
    );
  }
}
