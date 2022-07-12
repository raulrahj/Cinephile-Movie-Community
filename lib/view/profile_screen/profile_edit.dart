import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';

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
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as ProfileEditArg;
    String? firstname = data.data.user!.firstname;
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
              child: Column(children: [
                FutureBuilder(
                    future: UserFunc().getUser(id: data.data.user!.id!),
                    builder: (context, AsyncSnapshot snapshot) {
                      return AspectRatio(
                        aspectRatio: 8 / 4,
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
                              child: Row(
                                children: [
                                  kWidth1,
                                  Container(
                                    width: 110,
                                    height: 120,
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: const [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(urlImg1),
                                          radius: 54,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: ImageButton(),
                                        )
                                      ],
                                    ),
                                  ),
                                  kWidth2,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data.firstname ?? 'Username',
                                        style: GoogleFonts.oswald().copyWith(
                                            fontSize: 18, color: kWhite),
                                      ),
                                      Text(
                                        snapshot.data!.username ??
                                            'abc@gmail.com',
                                        style: const TextStyle(color: kWhite),
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
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ImageButton(),
                              ),
                            )
                          ],
                        ),
                      );
                    }),

                kHeight2,
                // Text('Username'),
                // Text('abc@gmail.com'),
                Form(
                  key: formKey,
                  child: SizedBox(
                    child: Column(children: [
                      kHeight1,
                      DefaultTextField(
                        label: 'First Name',
                        onSaved: (onSaved) {
                          onSaved != null
                              ? firstname = onSaved
                              : data.data.user!.firstname;
                        },
                        // controller: firstNameC,
                      ),
                      kHeight1,
                      DefaultTextField(
                        label: 'Last Name',
                        onSaved: (onSaved) {
                          onSaved != null
                              ? lastname = onSaved
                              : data.data.user!.lastname;
                        },
                        // controller: lastNameC,
                      ),
                      kHeight1,
                      DefaultTextField(
                        label: 'Bio',
                        onSaved: (onSaved) {
                          onSaved != null
                              ? bio = onSaved
                              : data.data.user!.about;
                        },
                        // controller: bioC..text = data.data.user!.about!,
                      ),
                    ]),
                  ),
                )
              ]),
            ),
            kHeight2,
            // const SizedBox.expand(),
            DefaultButton(
              text: const Text(
                'Update',
                style: TextStyle(color: kWhite),
              ),
              function: () async {
                formKey.currentState!.save();
                final kdata = UserResp(
                    username: data.data.user!.username,
                    firstname: firstname!,
                    // firstname: firstNameC.text ?? data.data.user!.firstname,
                    lastname: lastname!,
                    about: bio ?? '');
                final userFunc = UserFunc();
                await userFunc
                    .updateUser(id: data.data.user!.id!, userData: kdata)
                    .whenComplete(() => Navigator.of(context).pop());
              },
            ),
            kHeight2
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: IconButton(
          // style: ElevatedButton.styleFrom(
          //     alignment: Alignment.centerLeft,
          //     primary: kWhite.withOpacity(0.3),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     )),
          icon: const Icon(Icons.photo_camera_outlined),
          onPressed: () async {
            final ImagePicker _picker = ImagePicker();
      
            showDialog(
                context: context,
                builder: (ctx) {
                  return SimpleDialog(
                    title: const Text('open'),
                    contentPadding:
                        const EdgeInsets.fromLTRB(24.0, 12.0, 5.0, 16.0),
                    children: [
                      GestureDetector(
                        child: const Text("Camera"),
                        onTap: () async {
                          try {
                            final XFile? photo = await _picker.pickImage(
                                source: ImageSource.camera);
                            print(photo);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      kHeight1,
                      GestureDetector(
                          child: const Text("Gallery"),
                          onTap: () async {
                            try {
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              print(File(photo!.path));
                            } catch (e) {
                              print(e);
                            }
                          })
                    ],
                  );
                });
          }),
    );
  }
}

class DTextForm extends StatelessWidget {
  const DTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField();
  }
}
