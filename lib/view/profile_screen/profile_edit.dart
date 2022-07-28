import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/util/util.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';
import 'package:open_box/view/widgets/linear_textfield.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class ProfileEditArg {
  final ProfileModel data;

  ProfileEditArg(this.data);
}

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController bioC = TextEditingController();
  File? profileImg;
  File? coverImg;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // final data = ModalRoute.of(context)?.settings.arguments as ProfileEditArg;
    // firstNameC.text = data.data.user!.firstname;
    // lastNameC.text = data.data.user!.lastname;
    // bioC.text = data.data.user!.about!;
    super.initState();
  }

  @override
  void dispose() {
    firstNameC.dispose();
    lastNameC.dispose();
    bioC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as ProfileEditArg;
    String? firstname;
    String? lastname;
    String? bio;

    return Scaffold(
      appBar: AppBar(
        leading: close(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // kHeight2,
            SizedBox(
              height: dHeight(context) * .74,
              child: Column(
                children: [
                  FutureBuilder(
                    future: UserRepo().getUser(id: data.data.user!.id!),
                    builder: (context, AsyncSnapshot snapshot) {
                      return BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is CurrentUserState) {
                            return SizedBox(
                              child: AspectRatio(
                                aspectRatio: 8 / 4,
                                child: Stack(
                                  children: [
                                    SizedBox.expand(
                                      child: Image(
                                        color: const Color(0xff0d69ff)
                                            .withOpacity(1.0),
                                        colorBlendMode: BlendMode.softLight,
                                        image: NetworkImage(
                                            "$kApiImgUrl/${state.profileData!.user!.coverPicture}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          kWidth1,
                                          Container(
                                            width: 110,
                                            height: 120,
                                            alignment: Alignment.center,
                                            child: Stack(
                                              children: [
                                                profileImg != null
                                                    ? const CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                profImg1),
                                                        radius: 54,
                                                      )
                                                    : CircleAvatar(
                                                        backgroundImage: NetworkImage(
                                                            "$kApiImgUrl/${state.profileData!.user!.profilePicture}"),
                                                        radius: 54,
                                                      ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: ImageButton(
                                                    onTap: () async {
                                                      profileImg = await UtilRepo
                                                          .pickImage(context);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          kWidth2,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .profileData!.user!.firstname,
                                                style: GoogleFonts.oswald()
                                                    .copyWith(
                                                        fontSize: 18,
                                                        color: kWhite),
                                              ),
                                              Text(
                                                snapshot.data!.username ??
                                                    'abc@gmail.com',
                                                style: const TextStyle(
                                                    color: kWhite),
                                              ),
                                              kHeight1,
                                              Text(
                                                snapshot.data!.about ?? "bio :)",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(color: kWhite),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: ImageButton(
                                          onTap: () async {
                                            coverImg =
                                                await UtilRepo.pickImage(context);
                                          },
                                          // image: coverImg,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const ProgressCircle();
                          }
                        },
                      );
                    },
                  ),

                  kHeight2,
                  // Text('Username'),
                  // Text('abc@gmail.com'),
                  Form(
                    key: formKey,
                    child: SizedBox(
                      child: Column(
                        children: [
                          kHeight1,
                          LinearTextField(
                            label: 'First Name',
                            onSaved: (onSaved) {
                              onSaved != null
                                  ? firstname = onSaved
                                  : data.data.user!.firstname;
                            },
                            controller: firstNameC,
                          ),
                          kHeight1,
                          LinearTextField(
                            label: 'Last Name',
                            onSaved: (onSaved) {
                              onSaved != null
                                  ? lastname = onSaved
                                  : data.data.user!.lastname;
                            },
                            controller: lastNameC,
                          ),
                          kHeight1,
                          LinearTextField(
                            label: 'Bio',
                            onSaved: (onSaved) {
                              onSaved != null
                                  ? bio = onSaved
                                  : data.data.user!.about;
                            },
                            controller: bioC,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            kHeight2,
            // const SizedBox.expand(),
            DefaultButton(
              text: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: kWhite,
                        color: kSecondary,
                      ),
                    );
                  } else {
                    return const Text(
                      'Update',
                      style: TextStyle(color: kWhite),
                    );
                  }
                },
              ),
              function: () async {
                final String? profilePic;
                if (profileImg != null) {
                  profilePic = await UtilRepo.uploadImage(profileImg!);
                } else {
                  profilePic = null;
                }
                formKey.currentState!.save();
                final kdata = UserResp(
                    username: data.data.user!.username,
                    firstname: firstname!,
                    // firstname: firstNameC.text ?? data.data.user!.firstname,
                    lastname: lastname!,
                    about: bio ?? '',
                    profilePicture: profilePic);
                // final userRepo = UserRepo();
                // ignore: use_build_context_synchronously
                context.read<UserBloc>().add(
                    UpdateUserEvent(id: data.data.user!.id!, userData: kdata));

                BlocListener<UserBloc, UserState>(listener: (context, state) {
                  if (state is UserLoadingState) {
                    print('PROFILE UPDATED AND LISTENER CALLED');
                  }
                });
              },
            ),
            kHeight2
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageButton extends StatefulWidget {
  const ImageButton({
    Key? key,
    this.onTap,
    // this.image,
  }) : super(key: key);
  // var image;
  final void Function()? onTap;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  File? image;
// final coverImg;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: kWhite.withOpacity(0.7),
      child: SizedBox(
        width: 35,
        height: 30,
        child: IconButton(
          icon: const Icon(Icons.photo_camera_outlined),
          onPressed: widget.onTap,
        ),
      ),
    );
  }

}
