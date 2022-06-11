import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class GChatScreen extends StatefulWidget {
  GChatScreen({Key? key}) : super(key: key);

  @override
  State<GChatScreen> createState() => _GChatScreenState();
}

class _GChatScreenState extends State<GChatScreen> {
  @override
  Widget build(BuildContext context) {
    _chatBubble(bool isMe) {
      if (isMe) {
        return Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: dWidth(context) * 80,
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'messege',
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'time',
                  style: TextStyle(color: Colors.black54),
                ),
                kWidth1,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(profImg1),

                    radius: 19,
                  ),
                ),
              ],
            )
          ],
        );
      } else {
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: dWidth(context) * 80,
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: kBorderRadius,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: const Text('messege'),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(profImg),
                    radius: 19,
                  ),
                ),
                kWidth1,
                const Text(
                  'time',
                  style: TextStyle(color: Colors.black54),
                )
              ],
            )
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Cinephiles',
              style: GoogleFonts.dmSans().copyWith(fontSize: 18),
              children: const [
                TextSpan(text: '\n'),
                TextSpan(text: '14 online', style: TextStyle(fontSize: 12))
              ]),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 10,
              reverse: true,
              itemBuilder: (context, index) {
                return _chatBubble(index % 2 == 0 ? true : false);
              }),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.photo,
                  color: Theme.of(context).primaryColor,
                )),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration.collapsed(
                  hintText: 'sent messeages here...'),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ))
          ],
        )
      ]),
    );
  }
}
