import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:open_box/view/search_screen/group_search/s_group_search.dart';
import 'package:open_box/view/search_screen/user_search/s_user_result.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

import 'movie_search/s_movie_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            // physics: const ScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:  CupertinoSearchTextField(),
          ),
          Visibility(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionChip(label: const Text('Users'), onPressed: () {}),
                ActionChip(label: const Text('Groups'), onPressed: () {}),
                ActionChip(label: const Text('Movies'), onPressed: () {}),
              ],
            ),
          )),
          Expanded(child: const MovieSResult())
          // SingleChildScrollView(
          //   child: ProgressCircle(),
          // )
        ],
      )),
    );
  }
}
