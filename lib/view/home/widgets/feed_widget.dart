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
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';

class HFeedWdget extends StatefulWidget {
  const HFeedWdget({Key? key, this.postdata, this.username}) : super(key: key);
  final Post? postdata;
  final String? username;
  @override
  State<HFeedWdget> createState() => _HFeedWdgetState();
}

class _HFeedWdgetState extends State<HFeedWdget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
                    //     print('MMMMMMMMMMMMMMNNNNNNNNNNNNNMN');
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
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(profImg),
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
                    dateFormat(widget.postdata!.createdAt) ?? "justnow",
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
        widget.postdata!.desc!.length >20 ?  GestureDetector(
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
          ):none,
          kHeight1,
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Image(
              image: NetworkImage(
                  "$kApiImgUrl/${widget.postdata!.image}" ?? urlImg1),
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
                        label: Text(
                          widget.postdata!.likes!.length.toString() ?? '456',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onPressed: () async {
                          // final data = await PostRepo().allPost();
                        },
                        icon: const Icon(Icons.whatshot_outlined),
                      ),
                      // const Text(
                      //   '456',
                      // ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/comments');
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
  }

  String dateFormat(datetime) => DateFormat.MMMMEEEEd().format(datetime);
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
