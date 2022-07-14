import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
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
                child: ListView(
              shrinkWrap: true,
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
                                  backgroundImage: NetworkImage("$kImgHost/${state.userData!.profilePicture}"),
                                
                                  radius: 44,
                                ),
                                // kHeight2,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.userData!.firstname,
                                      style: GoogleFonts.oswald().copyWith(
                                          fontSize: 18, color: kWhite),
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
                                // })
                                ActionChip(
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
                ListView.builder(
                  shrinkWrap: true,
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisCount: 2,
                  // ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        height: dHeight(context) * .10,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),

                        // height: 100,
                        width: dWidth(context),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 60,
                              height: 60,
                              child: Image(
                                image: NetworkImage(urlImg1),
                                fit: BoxFit.cover,
                              ),
                            ),
                            kWidth1,
                            Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      lorem,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      '3-2-2020',
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
                )
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
