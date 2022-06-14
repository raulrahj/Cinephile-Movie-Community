import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/view/widgets/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: pop(context),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            kHeight2,
            AspectRatio(
              aspectRatio: 3 / 2.5,
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(profImg),
                    radius: 54,
                  ),
                  kHeight2,
                  Text(
                    'Username',
                    style: GoogleFonts.oswald().copyWith(fontSize: 18),
                  ),
                  const Text('abc@gmail.com'),
                  kHeight1,
                  ActionChip(
                      label: const Text('edit profile'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile_edit');
                      }),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const Card(
                  color: kBlack,
                  child: Image(
                    image: NetworkImage(urlImg1),
                    fit: BoxFit.fill,
                  ),
                );
              },
            )
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
    return SizedBox(
      width: dWidth(context) / 2.2,
      height: dHeight(context) * .09,
      // color: Colors.accents[5],
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('followers'),
        // kHeight1,
        Text(
          '35151',
          style: Theme.of(context).textTheme.headline6,
        )
      ]),
    );
  }
}
