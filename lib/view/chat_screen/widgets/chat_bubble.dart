import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/data/util/date_parse.dart';

Widget chatBubble(MessageModel messege, bool isMe, BuildContext context) {
  if (isMe) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(
              // minHeight: 5,
              // minHeight: dHeight(context)/91,
              // maxHeight: dHeight(context) * 80,
              maxWidth: dWidth(context) * 80,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(kRadius),
                  topRight: const Radius.circular(kRadius),
                  bottomLeft: Radius.circular(isMe ? kRadius : 0)),
              //  BorderRadius.circular(kRadius),
              boxShadow: [
                BoxShadow(
                    color: isMe ? Colors.grey.withOpacity(0.5) : kBlack,
                    blurRadius: 2,
                    spreadRadius: 2)
              ],
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              messege.text,
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              ParseDate.dFormatTime(messege.createdAt ?? DateTime.now()),
              style: const TextStyle(color: kTextBlack),
            ),
            kWidth1,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))],
              ),
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(profImg1),
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(!isMe ? 0 : kRadius),
                  topRight: const Radius.circular(kRadius),
                  bottomLeft: const Radius.circular(kRadius),
                  bottomRight: const Radius.circular(kRadius),
                ),
                //  BorderRadius.circular(kRadius),
                boxShadow: [
                  BoxShadow(
                      color: isMe ? kBlack : Colors.grey.withOpacity(0.5),
                      blurRadius: .5,
                      spreadRadius: .5)
                ]),
            child: Text(
              messege.text,
              style: const TextStyle(
                  color: kTextBlack, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))]),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(profImg1),
                radius: 10,
              ),
            ),
            kWidth1,
            Text(
              ParseDate.dFormatTime(messege.createdAt ?? DateTime.now()),
              style: const TextStyle(color: Colors.black54),
            )
          ],
        )
      ],
    );
  }
}
