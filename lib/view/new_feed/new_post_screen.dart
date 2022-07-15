import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/profile_edit.dart';
import 'package:open_box/view/widgets/common.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? postImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Share your thoughts',
            style: GoogleFonts.dmSans(),
          ),
          leading: close(context)),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is CurrentUserState) {
                return AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(profImg),
                      ),
                      kWidth1,
                      Text(
                        state.profileData!.user!.firstname ?? 'Username',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              } else {
                return const AspectRatio(aspectRatio: 3 / 1);
              }
            },
          ),
          Expanded(
              child: TextFormField(
            decoration: const InputDecoration.collapsed(
              hintText: 'what is on your mind?',
            ),
          )),
          Container(
            width: dWidth(context),
            height: 44,
            color: kBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    UtilRepo.pickImage(context);
                  },
                  icon: const Icon(Icons.photo)),
              TextButton(
                  onPressed: () async {
                    final userData = await SharedService.getUserProfile();
                    final postData = Post(
                        desc: lorem,
                        userId: userData!.user!.id,
                        image:
                            '20220714193220876806image_cropper_1657807310550.jpg',
                        comments: [],
                        likes: []);
                    PostRepo()
                        .createPost(postData: postData, id: userData.user!.id!);
                  },
                  child: const Text('Share'))
            ],
          )
        ]),
      ),
    );
  }
}
