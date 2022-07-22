import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/view/widgets/common.dart';

class CommentArg {
  final List<Comment> comments;
  final Post postData;
  CommentArg({required this.comments, required this.postData});
}

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    final arg = ModalRoute.of(context)?.settings.arguments as CommentArg;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: pop(context),
        title: const Text('Comments'),
      ),
      body: SafeArea(
        child: Column(
          // shrinkWrap: true,
          children: [
            Expanded(
              flex: 8,
              child: SizedBox(
                height: dHeight(context) * .8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: arg.comments.length,
                  itemBuilder: (context, index) {
                    final data = arg.comments[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      // "$kApiImgUrl/${data.commentedUserData.}" ??
                                      profImg),
                                  radius: 15,
                                ),
                                kWidth2,
                                Text(
                                  data.commentedUserData!.firstname ??
                                      'Username',
                                  style: GoogleFonts.oswald(),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                kWidth4,
                                kWidth1,
                                // LayoutBuilder(builder: (context, constraints) {
                                //   return
                                Expanded(
                                  child: Text(  
                                    data.text ?? lorem,
                                    // maxLines: 5,
                                    style: GoogleFonts.dmSans().copyWith(
                                        // overflow: TextOverflow.ellipsis
                                        ),
                                  ),
                                )
                                // }),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Theme.of(context).primaryColor,
                    )),
                Expanded(
                    child: TextFormField(
                  controller: commentController,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'comment here...'),
                )),
                TextButton(
                    onPressed: () {
                      final data = Comment(
                          text: commentController.text,
                          postId: arg.postData.id,
                          postedBy: arg.postData.userId);
                      context
                          .read<PostBloc>()
                          .add(CommentPostEvent(commentData: data));
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Text("Post")
                    // Icon(
                    //   Icons.send,
                    //   color: Theme.of(context).primaryColor,
                    // )
                    )
              ],
            ),
            kHeight1,
          ],
        ),
      ),
    );
  }
}
