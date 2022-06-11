import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:open_box/view/discover/new_releases/new_releases.dart';
import 'package:open_box/view/discover/trending/trending_screen.dart';
import 'package:open_box/view/discover/upcoming/upcoming_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification){
          final scrollDirection =notification.direction;
          if(scrollDirection ==ScrollDirection.forward){
            setState(() {
              isFull=false;
            });
          }else if (scrollDirection==ScrollDirection.reverse){
            setState(() {
              isFull =false;
            });
          }
          return true;
        },
        child: SafeArea(
            child: PageView(children: const [
          NewReleaseScreen(),
          TrendingScreen(),
          UpcomingScreen()
        ])),
      ),
    );
  }
}
