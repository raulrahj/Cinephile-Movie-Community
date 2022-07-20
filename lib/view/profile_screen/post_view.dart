import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/logic/bloc/bloc/post_bloc.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          children: [
            Row(
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
            Text(
              data!.desc!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            kHeight1,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child:
                    Image(image: NetworkImage("$kApiImgUrl/${data!.image}"))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () async {
                  context
                      .read<PostBloc>()
                      .add(DeletePostEvent(postId: data!.id!));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
