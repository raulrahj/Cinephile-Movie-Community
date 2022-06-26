import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/logic/bloc/trending/trending_bloc.dart';
import 'package:open_box/view/home/widgets/feed_widget.dart';
import 'package:open_box/view/home/widgets/horizontal_list.dart';
import 'package:open_box/view/register/otp_verification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<TrendingBloc>().add(const TrendingEvent.getTrending());
    // BlocProvider.of<TrendingBloc>(context).add(const TrendingEvent.getTrending());
    });
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add_comment_outlined),
          onPressed: () {
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
              icon: const Icon(Icons.notifications))
        ],
      ),
      body: SafeArea(
        child: ListView(
          // shrinkWrap: true,
          // physics: const ClampingScrollPhysics(),
          children: [
            const HeadlineWidget(
              title: 'Trending',
              color: Colors.black54,
            ),
            const HhorizontalWidget(),
            const HeadlineWidget(
              title: 'New post',
              color: Colors.black54,
            ),
            ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const HFeedWdget();
                })
          ],
        ),
      ),
    );
  }
}
