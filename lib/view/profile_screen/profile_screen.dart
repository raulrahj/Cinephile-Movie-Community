import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/home/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            kHeight2,
            AspectRatio(
              aspectRatio: 3 / 2.1,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 54,
                  ),
                  kHeight2,
                  Text('Username'),
                  Text('abc@gmail.com'),
                  kHeight1,
                  Container(
                    width: double.infinity,
                    // height: 90,
                    color: kWhite,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          PFCountWidget(),
                          PFCountWidget(),
                        ]),
                  )
                ],
              ),
            ),
            // ListView(
            //   shrinkWrap: true,
            //   children: [HCardWidget()],
            // )
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(color: kBlack,);
              },
            )
            // GridView.builder(
            //   shrinkWrap: true,
            //   // physics: ClampingScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,),
            //     itemBuilder: (context, index) {
            //       return HCardWidget();
            //     })
// GridView.custom(
//   shrinkWrap: true,
//   physics: ClampingScrollPhysics(),
//   gridDelegate: SliverQuiltedGridDelegate(
//     crossAxisCount: 4,
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//     repeatPattern: QuiltedGridRepeatPattern.inverted,
//     pattern: [
//       QuiltedGridTile(2, 2),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 2),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) => HCardWidget(),
//   ),
// )
          ],
        ),
      ),
    );
  }
}

class PFCountWidget extends StatelessWidget {
  const PFCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dWidth(context) / 2.2,
      height: dHeight(context) * .09,
      // color: Colors.accents[5],
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('followers'),
        // kHeight1,
        Text(
          '35151',
          style: Theme.of(context).textTheme.headline6,
        )
      ]),
    );
  }
}
