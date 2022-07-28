import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/data/util/util.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/widgets/common.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? postImg;
  String? postImgName;
  TextEditingController postDiscripControllr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  final Use = GlobalState.of(context);
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
                      CircleAvatar(
                        backgroundImage: const NetworkImage(profImg),
                        radius: dWidth(context) / 14,
                      ),
                      kWidth1,
                      Text(
                        state.profileData!.user!.firstname,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.public,
                        color: Theme.of(context).primaryColor,
                      )
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
            controller: postDiscripControllr,
            maxLines: 100,
            decoration: const InputDecoration.collapsed(
              hintText: 'what is on your mind?',
            ),
          )),
          Container(
            width: dWidth(context),
            // height: 44,
            constraints: const BoxConstraints(maxHeight: 150, minHeight: 100),
            // color: kBlack,
            decoration: postImg != null
                ? BoxDecoration(
                    image: DecorationImage(image: FileImage(postImg!)),
                  )
                : const BoxDecoration(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    postImg =
                        await UtilRepo.pickImage(context).whenComplete(() {
                      setState(() {});
                    });
                    if (postImg == null) return;
                  },
                  icon: const Icon(Icons.photo)),
              TextButton(
                  onPressed: () async {
                    if (postImg != null) {
                      postImgName = await UtilRepo.uploadImage(postImg!);
                    }
                    final userData = await SharedService.getUserProfile();
                    final postData = Post(
                        desc: postDiscripControllr.text,
                        userId: userData!.user!.id,
                        image: postImgName,
                        comments: [],
                        likes: []);
                    await PostRepo()
                        .createPost(
                          postDat: postData,
                        )
                        .then((value) => Navigator.pop(context));
                  },
                  child: const Text('Share'))
            ],
          )
        ]),
      ),
    );
  }
}
