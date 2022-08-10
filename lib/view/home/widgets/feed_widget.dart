import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/data/util/date_parse.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/home/widgets/bottom_sheet.dart';
import 'package:open_box/view/widgets/placeholders.dart';

class HFeedWdget extends StatefulWidget {
  const HFeedWdget({Key? key, this.postdata, this.currentUser})
      : super(key: key);
  final Post? postdata;
  final ProfileModel? currentUser;
  @override
  State<HFeedWdget> createState() => _HFeedWdgetState();
}

class _HFeedWdgetState extends State<HFeedWdget> {
  // bool isExpanded = false;
  bool isLiked = false;
  String img = profImg;
  double buttonSize = 30.0;
  ValueNotifier<bool> likeNotifier = ValueNotifier(false);
  ValueNotifier<bool> expandNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    // context.read<PostBloc>().add(GetPostEvent(id: widget.postdata!.id!));
    likeNotifier.value =
        widget.postdata!.likes!.contains(widget.currentUser!.user!.id)
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
                    final UserModel userdata = snapshot.data;
                    return ListTile(
                      onTap: () async {
                        context.read<UserBloc>().add(
                            LoadUserEvent(userId: widget.postdata!.userId!));

                        Navigator.pushNamed(
                          context,
                          '/user_screen',
                        );
                        // });
                      },
                      leading: userdata.username == "admin"
                          ? const CircleAvatar(
                              backgroundImage: AssetImage(logo),
                            )
                          : CircleAvatar(
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
                        ParseDate.dFormatDate(widget.postdata!.createdAt),
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
            child: ValueListenableBuilder(
                valueListenable: expandNotifier,
                builder: (context, bool isExpand, _) {
                  return LayoutBuilder(
                    builder: (context, constraints) => Text(
                      widget.postdata!.desc ?? lorem,
                      overflow: TextOverflow.ellipsis,
                      maxLines: isExpand ? 100 : 2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontFamily: fH2.fontFamily,
                          ),
                    ),
                  );
                }),
          ),
          widget.postdata!.desc!.length > 20
              ? ValueListenableBuilder(
                  valueListenable: expandNotifier,
                  builder: (context, bool isExpand, _) {
                    return GestureDetector(
                      child: Text(
                        isExpand ? '  show less' : '  see more',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      onTap: () {
                        expandNotifier.value = !expandNotifier.value;
                        expandNotifier.notifyListeners();
                      },
                    );
                  })
              : none,
          kHeight1,
          ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: widget.postdata!.image != null
                  ? Image.network(
                      "${widget.postdata!.image}",
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(child: PTile());
                        }
                      },
                      errorBuilder: (BuildContext context, _, __) {
                        return Image.asset(feedImgPlaceHolder);
                      },
                    )
                  : null),
          AspectRatio(
            aspectRatio: 3 / .5,
            child: SizedBox(
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
                              start: Color.fromARGB(255, 255, 217, 0),
                              end: Color.fromARGB(255, 204, 139, 0)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color.fromARGB(255, 255, 229, 81),
                            dotSecondaryColor: Color.fromARGB(255, 19, 98, 124),
                          ),
                          likeBuilder: (isLike) {
                            return Icon(
                              Icons.whatshot,
                              color: newBool ? kSecondary : Colors.grey,
                              size: buttonSize,
                            );
                          },
                          likeCount: widget.postdata!.likes!.length,
                          onTap: (isLiked) async {
                            await PostRepo().likePost(id: widget.postdata!.id!);
                            // setState(() {
                            isLiked = !isLiked;
                            likeNotifier.value = isLiked;
                            likeNotifier.notifyListeners();
                            // });
                            return newBool;
                          },
                        );
                      }),
                  const Spacer(),
                  Row(
                    children: [
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
                          shareBSheet(context, widget.postdata!.desc!);
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
  }
}
