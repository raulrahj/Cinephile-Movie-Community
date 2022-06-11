import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/account'),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(profImg),
            ),
            title: Text(
              "Username",
              style: GoogleFonts.dmSans().copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'justnow',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: LayoutBuilder(
              builder: (context, constraints) => Text(
                lorem,
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 10 : 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: fH2.fontFamily,
                    ),
              ),
            ),
          ),
          GestureDetector(
            child: const Text(
              '  see more',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          kHeight1,
          const Image(image: NetworkImage(urlImg)),
          AspectRatio(
            aspectRatio: 3 / .5,
            child: SizedBox(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.whatshot_outlined,
                            color: kBlack,
                          )),
                          const Text('456',),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/comments');
                        },
                        icon: const Icon(
                          Icons.mode_comment_outlined,
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: dHeight(context) / 3.8,
                            child: Column(
                              children: const [
                                Divider(
                                  thickness: 7,
                                  indent: 150,
                                  endIndent: 150,
                                ),
                                kHeight3,
                                ListTile(
                                  leading: Icon(Icons.group),
                                  title: Text('share to Group'),
                                ),
                                div,
                                ListTile(
                                  leading: Icon(Icons.whatsapp),
                                  title: Text('share to Whatsapp'),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.share,
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
