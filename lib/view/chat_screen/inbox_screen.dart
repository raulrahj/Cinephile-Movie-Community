import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inbox')),
      body: SafeArea(
          child: ListView(
        children: [
          const HeadlineWidget(title: 'Group chats'),
          LimitedBox(
            maxHeight: 115,
            maxWidth: dWidth(context),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ChatAvatar(radius: 35.0),
                              Text('Group Name',
                                  style: GoogleFonts.dmSans().copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kBlack))
                            ]),
                      ),
                    )),
          ),
          const HeadlineWidget(title: 'Personal chats'),
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    width: dWidth(context),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ChatAvatar(radius: 28.0),
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
                                      color: kBlack),
                                ),
                                const Text(
                                  "Time",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                );
              })
        ],
      )),
    );
  }
}

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    Key? key,
    required this.radius,
  }) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: kBlack,
              spreadRadius: .5,
              blurRadius: 2,
              // blurStyle:
            )
          ],
          border: Border.all(width: 2, color: Colors.amberAccent)),
      child: CircleAvatar(
        radius: radius,
      ),
    );
  }
}
