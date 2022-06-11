import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:open_box/view/search_screen/group_search/s_group_search.dart';
import 'package:open_box/view/search_screen/user_search/s_user_result.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

import 'movie_search/s_movie_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
int search= 0;
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
                ActionChip(label: const Text('Users'), onPressed: () {
                    setState(() {
                      search=0;
                    });
                }),
                ActionChip(label: const Text('Groups'), onPressed: () {
                   setState(() {
                      search=1;
                    });
                }),
                ActionChip(label: const Text('Movies'), onPressed: () {
                   setState(() {
                      search=2;
                    });
                }),
              ],
            ),
          )),
          Expanded(child: _searchresult())
          // SingleChildScrollView(
          //   child: ProgressCircle(),
          // )
        ],
      )),
    );
  }
 Widget _searchresult(){
    if(search==2){
      return const MovieSResult();
    }
    else if(search==1){
      return const GroupSResult();
    }else{
      return const UserSResult();
    }
  }
}
