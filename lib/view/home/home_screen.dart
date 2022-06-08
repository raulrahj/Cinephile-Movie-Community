import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/widgets/bottom_nav.dart';
import 'package:open_box/view/register/widgets/or_divider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("CinePhile"),
      //   centerTitle: true,
      // ),
      // backgroundColor: Theme.of(context).primaryColorLight,
      // bottomNavigationBar: const BottomNav(),
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

class HhorizontalWidget extends StatelessWidget {
  const HhorizontalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: double.infinity,
      maxHeight: dHeight(context) / 4.9,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return const HCardWidget();
        },
      ),
    );
  }
}

class HCardWidget extends StatelessWidget {
  const HCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: dWidth(context) / 3.8,
      height: dHeight(context) / 4.9,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(kRadius)),
    );
  }
}

class HFeedWdget extends StatefulWidget {
  const HFeedWdget({Key? key}) : super(key: key);

  @override
  State<HFeedWdget> createState() => _HFeedWdgetState();
}

class _HFeedWdgetState extends State<HFeedWdget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: double.infinity,
      // height: dHeight(context) / 1.7,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.03)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(urlImg),
          ),
          title: Text("Username"),
          subtitle: Text('justnow'),
          trailing: Icon(Icons.more_vert),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: LayoutBuilder(
            builder: (context, constraints) => Text(
              lorem,
              overflow: TextOverflow.ellipsis,
              maxLines: isExpanded ? 10 : 2,
              
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: fH2.fontFamily,),
            ),
          ),
        ),
        GestureDetector(
          child: const Text('  see more'),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        const Image(image: NetworkImage(urlImg)),
        AspectRatio(
          aspectRatio: 3 / .5,
          child: SizedBox(
            // color: Colors.red,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.whatshot_sharp)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Theme.of(context).primaryColorLight,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: dHeight(context) / 2.9,
                              child: Column(children: const [
                                Divider(
                                  thickness: 10,
                                  indent: 150,
                                  endIndent: 150,
                                ),
                                kHeight3,
                                ListTile(
                                  leading: Icon(Icons.group),
                                  title: Text('to Group'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.whatsapp),
                                  title: Text('Whatsapp'),
                                )
                              ]),
                            );
                          });
                    },
                    icon: const Icon(Icons.share))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
