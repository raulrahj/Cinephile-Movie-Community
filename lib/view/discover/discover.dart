import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/logic/bloc/post/post_bloc.dart';
import 'package:open_box/view/discover/new_releases/new_releases.dart';
import 'package:open_box/view/discover/upcoming/upcoming_screen.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(GetAllPost());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final scrollDirection = notification.direction;
          if (scrollDirection == ScrollDirection.forward) {
            scrollNotifier.value = false;
          } else if (scrollDirection == ScrollDirection.reverse) {
            scrollNotifier.value = true;
          }
          return true;
        },
        child: SafeArea(
            child: PageView(children: const [
          NewReleaseScreen(),
          // TrendingScreen(),
          AllOverScreen()
        ])),
      ),
    );
  }
}
