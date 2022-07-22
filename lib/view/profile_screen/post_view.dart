import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/widgets/common.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key, this.data}) : super(key: key);
  final Post? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: pop(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(profImg),
                  ),
                  kWidth1,
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Text(
              data!.desc!,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15),
            ),
            kHeight1,
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: data!.image != null
                    ? Image(
                        image: NetworkImage("$kApiImgUrl/${data!.image}"),
                      )
                    : null),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/comments',
                      arguments: CommentArg(
                          comments: data!.comments!, postData: data!),
                    );
                  },
                  icon: const Icon(Icons.comment),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    context
                        .read<PostBloc>()
                        .add(DeletePostEvent(postId: data!.id!));
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
