import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';
import "package:http_parser/http_parser.dart";

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
                            print('buidler callling');
                            return AspectRatio(
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
                  print(profilePic);
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
                    // final snackBar =  SnackBar(
                    //   content: const Text('Hi, I am a SnackBar!'),
                    //   backgroundColor: (Colors.black12),
                    // );
                  }
                });

                // await userRepo
                //     .updateUser(id: data.data.user!.id!, userData: kdata)
                // .whenComplete(() => Navigator.of(context).pop());
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
          // () async {
          //   final ImagePicker picker = ImagePicker();

          //   showDialog(
          //       context: context,
          //       builder: (ctx) {
          //         return SimpleDialog(
          //           title: const Text('open'),
          //           contentPadding:
          //               const EdgeInsets.fromLTRB(24.0, 12.0, 5.0, 16.0),
          //           children: [
          //             GestureDetector(
          //               child: const Text("Camera"),
          //               onTap: () async {
          //                 try {
          //                   final XFile? photo = await picker.pickImage(
          //                       source: ImageSource.camera);
          //                   if (photo != null) {
          //                     image = await _cropImage(File(photo.path));
          //                     if (image != null) {
          //                       _uploadImage(image!);
          //                     } else {
          //                       _uploadImage(File(photo.path));
          //                     }
          //                   }
          //                   print(photo);
          //                 } catch (e) {
          //                   print(e);
          //                 }
          //               },
          //             ),
          //             kHeight1,
          //             GestureDetector(
          //                 child: const Text("Gallery"),
          //                 onTap: () async {
          //                   try {
          //                     final XFile? photo = await picker.pickImage(
          //                         source: ImageSource.gallery);
          //                     if (photo != null) {
          //                       // setState(() {
          //                       final croppedFile =
          //                           await ImageCropper().cropImage(
          //                         sourcePath: photo.path,
          //                         compressFormat: ImageCompressFormat.jpg,
          //                         compressQuality: 100,
          //                         aspectRatioPresets: [
          //                           CropAspectRatioPreset.square,
          //                           CropAspectRatioPreset.ratio3x2,
          //                           CropAspectRatioPreset.original,
          //                           CropAspectRatioPreset.ratio4x3,
          //                           CropAspectRatioPreset.ratio16x9
          //                         ],
          //                         uiSettings: [
          //                           AndroidUiSettings(
          //                               toolbarTitle: 'Crop',
          //                               toolbarColor: kBlack,
          //                               toolbarWidgetColor: Colors.white,
          //                               initAspectRatio:
          //                                   CropAspectRatioPreset.original,
          //                               lockAspectRatio: false),
          //                         ],
          //                       );
          //                       image = File(croppedFile!.path);
          //                       await _uploadImage(image!);
          //                       // print(photo.name);
          //                       // });
          //                     }
          //                     // print(File(photo!.path));
          //                   } catch (e) {
          //                     log(e.toString());
          //                   }
          //                 })
          //           ],
          //         );
          //       });
          // }
        ),
      ),
    );
  }

  Future<String?> _uploadImage(File image) async {
    Dio dio = Dio();
    String fileName =
        DateTime.now().toString().replaceAll(RegExp(r'[^0-9]+'), '') +
            image.path.split('/').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "name": fileName,
      "file": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType('image', 'jpg'),
      ),
      // "type": "image/jpg",
    });
    Map<String, String> requestHeaders = {
      "Content-Type": 'multipart/form-data',
      // 'Authorization': ''
    };
//     var stream =
// http.ByteStream(DelegatingStream.typed(image.openRead()));
    try {
      // print(formData.fields[0]);
      log('Upload Image try block');
      final response = await dio.post("$kApiUrl/upload/",
          data: formData, options: Options(headers: requestHeaders));
      log('Response got');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusMessage!);
        print(response.data);
        log('Image Uploaded !!!');
        return fileName;
      } else {
        print(response.statusMessage);
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      log('Status Code ${e.response}');
    } catch (e) {
      // print()
      log(e.toString());
    }
  }
}

class UtilRepo {
  static Future<File?> _cropImage(File? photo) async {
    File? image;
    if (photo != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: photo.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop',
              toolbarColor: kBlack,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        // setState(() {
        image = File(croppedFile.path);
        // });
        return image;
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<File?> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    File? image;
    File? selectedImg;
    await showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: const Text('open'),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 5.0, 16.0),
            children: [
              GestureDetector(
                child: const Text("Camera"),
                onTap: () async {
                  try {
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      image = await _cropImage(File(photo.path));
                      if (image != null) {
                        selectedImg = image;
                        // _uploadImage(image!);
                      } else {
                        selectedImg = File(photo.path);
                        // _uploadImage(File(photo.path));
                      }
                    }
                    // print(photo);
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
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (photo != null) {
                      image = await _cropImage(File(photo.path));
                      if (image != null) {
                        selectedImg = image;
                        // _uploadImage(image!);
                      } else {
                        selectedImg = File(photo.path);
                        // _uploadImage(File(photo.path));
                      }
                    }
                    // print(photo);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              // GestureDetector(
              //     child: const Text("Gallery"),
              //     onTap: () async {
              //       try {
              //         final XFile? photo = await picker.pickImage(
              //             source: ImageSource.gallery);
              //         if (photo != null) {
              //           // setState(() {
              //           final croppedFile =
              //               await ImageCropper().cropImage(
              //             sourcePath: photo.path,
              //             compressFormat: ImageCompressFormat.jpg,
              //             compressQuality: 100,
              //             aspectRatioPresets: [
              //               CropAspectRatioPreset.square,
              //               CropAspectRatioPreset.ratio3x2,
              //               CropAspectRatioPreset.original,
              //               CropAspectRatioPreset.ratio4x3,
              //               CropAspectRatioPreset.ratio16x9
              //             ],
              //             uiSettings: [
              //               AndroidUiSettings(
              //                   toolbarTitle: 'Crop',
              //                   toolbarColor: kBlack,
              //                   toolbarWidgetColor: Colors.white,
              //                   initAspectRatio:
              //                       CropAspectRatioPreset.original,
              //                   lockAspectRatio: false),
              //             ],
              //           );
              //           image = File(croppedFile!.path);
              //           await _uploadImage(image!);
              //           // print(photo.name);
              //           // });
              //         }
              //         // print(File(photo!.path));
              //       } catch (e) {
              //         log(e.toString());
              //       }
              //     })
            ],
          );
        });
    return selectedImg;
  }

  static Future<String?> uploadImage(File image) async {
    Dio dio = Dio();
    String fileName =
        DateTime.now().toString().replaceAll(RegExp(r'[^0-9]+'), '') +
            image.path.split('/').last;
    print(fileName);
    FormData formData = FormData.fromMap({
      "name": fileName,
      "file": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType('image', 'jpg'),
      ),
      // "type": "image/jpg",
    });
    Map<String, String> requestHeaders = {
      "Content-Type": 'multipart/form-data',
      // 'Authorization': ''
    };
//     var stream =
// http.ByteStream(DelegatingStream.typed(image.openRead()));
    try {
      // print(formData.fields[0]);
      log('Upload Image try block');
      final response = await dio.post("$kApiUrl/upload/",
          data: formData, options: Options(headers: requestHeaders));
      log('Response got');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusMessage!);
        print(response.data);
        log('Image Uploaded !!!');
        return fileName;
      } else {
        print(response.statusMessage);
        // return null;
      }
    } on DioError catch (e) {
      log(e.message);
      log('Status Code ${e.response}');
    } catch (e) {
      // print()
      log(e.toString());
    }
    return fileName;
  }
}
