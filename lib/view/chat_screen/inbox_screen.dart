import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/chat_screen/g_chat_screen.dart';
import 'package:open_box/view/chat_screen/p_chat_screen.dart';
import 'package:open_box/view/chat_screen/widgets/chat_avathar.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inbox'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: ListView(
          children: [
           const Padding(
              padding:  EdgeInsets.only(top: 10,left: 8,right: 8),
              child: CupertinoSearchTextField(),
            ),
            const HeadlineWidget(
              title: 'Group chats',
              color: kBlack,
            ),
            LimitedBox(
              maxHeight: 110,
              maxWidth: dWidth(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/group_chat');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ChatAvatar(radius: 33.0),
                          Text('Group Name',
                              style: GoogleFonts.dmSans().copyWith(
                                  fontWeight: FontWeight.bold, color: kBlack))
                        ]),
                  ),
                ),
              ),
            ),
            const HeadlineWidget(
              title: 'Personal chats',
              color: kBlack,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/personal_chat',
                        arguments: PChatArg(chatdata: chats));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    width: dWidth(context),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ChatAvatar(
                          radius: 27.0,
                        ),
                        kWidth1,
                        SizedBox(
                          width: dWidth(context) * .75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: GoogleFonts.dmSans().copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kBlack,
                                ),
                              ),
                              const Text(
                                "Time",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
