import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/widgets/placeholders.dart';

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
  String img = profImg;
  double buttonSize = 30.0;
  ValueNotifier<bool> likeNotifier = ValueNotifier(false);
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
          SizedBox(
            height: dHeight(context) / 9.6,
            child: FutureBuilder(
                future: UserRepo().getUser(id: widget.postdata!.userId!),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      onTap: () async {
                        context.read<UserBloc>().add(
                            LoadUserEvent(userId: widget.postdata!.userId!));
                        // UserRepo user = UserRepo();
                        // await user
                        //     .getUser(id: widget.postdata!.userId!)
                        //     .then((userData) async {
                        //   await
                        Navigator.pushNamed(
                          context,
                          '/user_screen',
                        );
                        // });
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(img),
                      ),
                      title: Text(
                        widget.postdata!.userId == "Admin"
                            ? "Cinephile Community"
                            : snapshot.data.firstname,
                        // : "Username",
                        style: GoogleFonts.dmSans()
                            .copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        dateFormat(widget.postdata!.createdAt),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: const Icon(Icons.more_vert),
                    );
                  } else {
                    return const PListTile();
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: LayoutBuilder(
              builder: (context, constraints) => Text(
                widget.postdata!.desc ?? lorem,
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 100 : 2,
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
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
              child: widget.postdata!.image != null
                  ? Image(
                      image:
                          NetworkImage("$kApiImgUrl/${widget.postdata!.image}"),
                      errorBuilder: ((BuildContext context, _, __) {
                        return const PTile();
                      }),
                    )
                  : null),
          AspectRatio(
            aspectRatio: 3 / .5,
            child: SizedBox(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kWidth1,
                  ValueListenableBuilder(
                      valueListenable: likeNotifier,
                      builder: (context, bool newBool, __) {
                        return LikeButton(
                          size: buttonSize,
                          circleColor: const CircleColor(
                              start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (isLike) {
                            print("bool is $isLiked");
                            return Icon(
                              Icons.whatshot,
                              color: isLiked ? kSecondary : Colors.grey,
                              size: buttonSize,
                            );
                          },
                          likeCount: widget.postdata!.likes!.length,
                          onTap: (isLiked) async {
                            await PostRepo().likePost(id: widget.postdata!.id!);
                            setState(() {
                              isLiked = !isLiked;
                              likeNotifier.value = isLiked;
                            });
                            return newBool;
                          },
                          countBuilder:
                              (int? count, bool islike, String? text) {
                            Widget res;
                            if (count == 0) {
                              res = const Text(
                                "show some power",
                                style: TextStyle(color: Colors.grey),
                              );
                            } else {
                              res = Text(
                                text!,
                                style: const TextStyle(color: Colors.grey),
                              );
                            }
                            print(count);
                            return res;
                          },
                          // countBuilder: (int count, bool isLiked, String text) {
                          //   var color =
                          //       isLiked ? Colors.deepPurpleAccent : Colors.grey;
                          //   Widget result;
                          //   if (count == 0) {
                          //     result = Text(
                          //       "love",
                          //       style: TextStyle(color: color),
                          //     );
                          //   } else
                          //     result = Text(
                          //       text,
                          //       style: TextStyle(color: color),
                          //     );
                          //   return result;
                          // },
                        );
                      }),
                  const Spacer(),
                  Row(
                    children: [
                      // TextButton.icon(
                      //   style: ButtonStyle(
                      //       foregroundColor: MaterialStateProperty.all(
                      //           isLiked ? kSecondary : kBlack)),
                      //   label: Text(
                      //     widget.postdata!.likes!.length.toString(),
                      //     style: Theme.of(context).textTheme.bodySmall,
                      //   ),
                      //   onPressed: () async {
                      //     await PostRepo().likePost(id: widget.postdata!.id!);
                      //     setState(() {
                      //       isLiked = !isLiked;
                      //     });
                      //     print(isLiked);

                      //   },
                      //   icon: const Icon(Icons.whatshot_outlined),
                      // ),
                      IconButton(
                        onPressed: () async {
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

                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
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
