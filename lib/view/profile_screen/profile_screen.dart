import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/view/widgets/common.dart';

class ProfileArg {
  final UserModel? user;
  final ProfileModel? loginUser;
  final bool isProfile;
  ProfileArg({this.loginUser, required this.isProfile, this.user});
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
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            // kHeight2,
            AspectRatio(
              aspectRatio: 3 / 2.1,
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
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: dHeight(context) * .20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(profImg),
                            radius: 44,
                          ),
                          // kHeight2,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              arg.isProfile
                                  ? Text(
                                      arg.loginUser!.user!.firstname ??
                                          'Username',
                                      style: GoogleFonts.oswald().copyWith(
                                          fontSize: 18, color: kWhite))
                                  : Text(
                                      arg.user!.firstname ?? 'Username',
                                      style: GoogleFonts.oswald().copyWith(
                                          fontSize: 18, color: kWhite),
                                    ),
                              arg.isProfile
                                  ? Text(
                                      arg.loginUser!.user!.username ??
                                          'abc@gmail.com',
                                      style: TextStyle(color: kWhite),
                                    )
                                  : Text(
                                      arg.user!.username ?? 'abc@gmail.com',
                                      style: TextStyle(color: kWhite),
                                    ),
                            ],
                          ),
                          // kHeight1,
                          ActionChip(
                              label: Text(
                                  arg.isProfile ? 'edit profile' : 'follow'),
                              onPressed: () async {
                                final data = await UserFunc()
                                    .updateUser(id: "62c148ce68f3b9763ad39e0a");
                                Navigator.pushNamed(context, '/profile_edit');
                              }),
                        ],
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
                          Expanded(
                              child: PFCountWidget(
                            count: '0',
                            title: 'Reviewed',
                          )),
                          Expanded(
                              child: PFCountWidget(
                            count: arg.isProfile
                                ? arg.loginUser!.user!.following!.length
                                        .toString() ??
                                    '23'
                                : arg.user!.following!.length.toString() ??
                                    '23',
                            title: 'following',
                          )),
                          Expanded(
                              child: PFCountWidget(
                            count: arg.isProfile
                                ? arg.loginUser!.user!.followers!.length
                                        .toString() ??
                                    '23'
                                : arg.user!.followers!.length.toString() ??
                                    '23',
                            title: 'followers',
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ListView(
            //   shrinkWrap: true,
            //   children: [HCardWidget()],
            // )
            ListView.builder(
              shrinkWrap: true,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 2,
              // ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    height: 100,
                    width: dWidth(context),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          // color: kBlack,
                          child: Image(
                            image: NetworkImage(urlImg1),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Expanded(
                            flex: 4,
                            child: Text(
                              lorem,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: const [
                                Icon(Icons.whatshot),
                                Text('234')
                              ],
                            ))
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
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
