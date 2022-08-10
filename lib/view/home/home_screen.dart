import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/home/widgets/feed_widget.dart';
import 'package:open_box/view/home/widgets/horizontal_list.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/widgets/info_messege.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(GetTimeline());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().getCurrentUser();
    context.read<ChatCubit>().getUserChats();
    // context.read<PostBloc>().add();
    PostRepo().allPost();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add_comment_outlined),
          onPressed: () {
            context.read<UserBloc>().add(LoadCurrentUser());
            Navigator.pushNamed(context, '/new_post');
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Text('Cinephile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/notifications'),
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<PostBloc>().add(GetTimeline());
          },

          // context.read<PostBloc>().add(GetAllPost()),
          child: ListView(
            // shrinkWrap: true,
            // physics: const ClampingScrollPhysics(),
            children: [
              const HeadlineWidget(
                title: 'Trending Cinema\'s',
                color: Colors.black54,
              ),
              const HhorizontalWidget(),
              const HeadlineWidget(
                title: 'Reviewed',
                color: Colors.black54,
              ),
              BlocBuilder<PostBloc, PostState>(
                  // future: PostRepo().allPost(),
                  builder: (context, state) {
                if (state is TimeLinePostState) {
                  return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.timelinePosts!.length,
                      itemBuilder: (context, index) {
                        final Post data = state.timelinePosts![index]!;
                        return HFeedWdget(
                          postdata: data,
                          currentUser: state.currentUser,
                        );
                      });
                } else if (state is PostErrorState) {
                  return const InfoMessageView();
                  // }
                  //  else if (state is PostLoading) {
                  //   return const PListed();
                } else {
                  return const AspectRatio(
                    aspectRatio: 3 / 3,
                    child: ProgressCircle(),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
