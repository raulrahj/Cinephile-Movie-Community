import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/bloc/post_bloc.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class HFeedWdget extends StatefulWidget {
  const HFeedWdget({Key? key, this.postdata, this.username}) : super(key: key);
  final Post? postdata;
  final String? username;
  @override
  State<HFeedWdget> createState() => _HFeedWdgetState();
}

class _HFeedWdgetState extends State<HFeedWdget> {
  bool isExpanded = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    // context.read<PostBloc>().add(GetPostEvent(id: widget.postdata!.id!));
    isLiked = widget.postdata!.likes!.contains("62cd0d25a06157de0a2496c1")
        ? true
        : false;
    // return BlocBuilder<PostBloc, PostState>(
    //   builder: (context, state) {
    //     if (state is AllPostState) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: double.infinity,
      // height: dHeight(context) / 1.7,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.03)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: UserRepo().getUser(id: widget.postdata!.userId!),
              builder: (context, AsyncSnapshot snapshot) {
                final img = snapshot.data.profilePicture != null
                    ? "$kApiImgUrl/${snapshot.data.profilePicture}"
                    : profImg;
                return ListTile(
                  onTap: () async {
                    print('Request getUser!!!!!!');
                    context
                        .read<UserBloc>()
                        .add(LoadUserEvent(userId: widget.postdata!.userId!));
                    print('pressed');
                    UserRepo user = UserRepo();
                    // BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                    //   if (state is UserLoadedState) {
                    //     print('!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!!!!!!!!!');

                    //   } else {

                    //   }

                    // });

                    final userData = await user
                        .getUser(id: widget.postdata!.userId!)
                        .then((userData) async {
                      await Navigator.pushNamed(
                        context,
                        '/user_screen',
                      );
                    });
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(img),
                  ),
                  title: Expanded(
                    child: Text(
                      widget.postdata!.userId == "Admin"
                          ? "Cinephile Community"
                          : snapshot.data.firstname,
                      // : "Username",
                      style: GoogleFonts.dmSans()
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    dateFormat(widget.postdata!.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: const Icon(Icons.more_vert),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: LayoutBuilder(
              builder: (context, constraints) => Text(
                widget.postdata!.desc ?? lorem,
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 10 : 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: fH2.fontFamily,
                    ),
              ),
            ),
          ),
          widget.postdata!.desc!.length > 20
              ? GestureDetector(
                  child: const Text(
                    '  see more',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(
                      () {
                        isExpanded = !isExpanded;
                      },
                    );
                  },
                )
              : none,
          kHeight1,
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Image(
              image: NetworkImage(
                  "$kApiImgUrl/${widget.postdata!.image}"),
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / .5,
            child: SizedBox(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // SupportButtonW(),
                      TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                isLiked ? kSecondary : kBlack)),
                        label: Text(
                          widget.postdata!.likes!.length.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onPressed: () async {
                          await PostRepo().likePost(id: widget.postdata!.id!);
                          setState(() {
                            isLiked = !isLiked;
                          });
                          // if (!isLiked) {
                          print(isLiked);
                          // PostRepo().likePost(id: widget.postdata!.id!);
                          // context
                          //     .read<PostBloc>()
                          //     .add(LikePostEvent(id: widget.postdata!.id!, ));
                          // } else {
                          // context.read<PostBloc>().add(UnlikePostEvent());
                          // }
                          // final data = await PostRepo().allPost();
                        },
                        icon: const Icon(Icons.whatshot_outlined),
                      ),
                      // const Text(
                      //   '456',
                      // ),
                      IconButton(
                        onPressed: () async {
                          //  await   PostRepo().addComment(Comment());
                          Navigator.pushNamed(context, '/comments',
                              arguments: CommentArg(
                                  comments: widget.postdata!.comments!,
                                  postData: widget.postdata!));
                        },
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: dHeight(context) / 3.8,
                            child: Column(
                              children: const [
                                Divider(
                                  thickness: 7,
                                  indent: 150,
                                  endIndent: 150,
                                ),
                                kHeight3,
                                ListTile(
                                  leading: Icon(Icons.group),
                                  title: Text('share to Group'),
                                ),
                                div,
                                ListTile(
                                  leading: Icon(Icons.whatsapp),
                                  title: Text('share to Whatsapp'),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.share,
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    //     } else {
    //       return const AspectRatio(aspectRatio: 3 / 2, child: ProgressCircle());
    //     }
    //   },
    // );
  }
}

class SupportButtonW extends StatefulWidget {
  const SupportButtonW({
    Key? key,
  }) : super(key: key);

  @override
  State<SupportButtonW> createState() => _SupportButtonWState();
}

class _SupportButtonWState extends State<SupportButtonW>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late Animation _colorAnimation;
  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   duration: const Duration(milliseconds: 500),
    //   vsync: this,
    // );

    _colorAnimation =
        ColorTween(begin: kBlack, end: Theme.of(context).iconTheme.color)
            .animate(_controller);
    // _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLiked = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isLiked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          onPressed: () {
            isLiked ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(Icons.whatshot_outlined, color: _colorAnimation.value),
        );
      },
    );
  }
}
