import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/infrastructure/post/postes.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/home/widgets/feed_widget.dart';
import 'package:open_box/view/home/widgets/horizontal_list.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

import '../../logic/bloc/bloc/post_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            FutureBuilder(
                future: PostRepo().allPost(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final Post data = snapshot.data[index];
                          print(" length print ${snapshot.data.length}");
                          // final user = getUsername(data.id);
                          return HFeedWdget(
                            postdata: data,
                          );
                        });
                  } else {
                    return const ProgressCircle();
                  }
                })
          ],
        ),
      ),
    );
  }
}
