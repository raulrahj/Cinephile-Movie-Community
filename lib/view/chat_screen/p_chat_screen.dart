// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/data/util/date_parse.dart';
import 'package:open_box/infrastructure/chat/chat_repo.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PChatArg {
  final UserModel userData;
  final String chatId;
  // final List<MessageModel>? chatdata;
  PChatArg({required this.chatId, required this.userData});
}

class PChatScreen extends StatefulWidget {
  const PChatScreen({Key? key}) : super(key: key);

  @override
  State<PChatScreen> createState() => _PChatScreenState();
}

class _PChatScreenState extends State<PChatScreen> {
  late TextEditingController _pChatController;
  IO.Socket? socket;
  // void initSocket() {
  //   socket = IO.io("192.168.100.174:8800", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   }
  //       // IO.OptionBuilder()
  //       // .setTransports(['websocket']) // for Flutter or Dart VM
  //       // .disableAutoConnect()  // disable auto-connection
  //       // .setExtraHeaders({'foo': 'bar'}) // optional
  //       // .build()
  //       );
  //   socket!.connect();
  //   // socket!.onconnect(() {
  //   //   // ignore: avoid_print;
  //   //   print("Connected");
  //   // });
  //   socket!.on("connect", (data) {
  //     print(data);
  //   });
  //   socket!.on("send-message", (data) {
  //     print(data);
  //   });
  //   socket!.on("new-user-add", (id) {
  //     print(id);
  //   });
  // }

  @override
  void initState() {
    _pChatController = TextEditingController();
    super.initState();
    // initSocket();
  }

  void sendMessage() {
    socket!.emit("send-message" "message");
  }

  @override
  void dispose() {
    super.dispose();
    // socket!.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as PChatArg;
    const currentUser = '62be900600b1aef58e50695d';
    _chatBubble(MessageModel messege, bool isMe) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                      color: kTextBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: arg.userData.firstname,
              style: GoogleFonts.dmSans().copyWith(fontSize: 18),
              children: const [
                TextSpan(text: '\n'),
                TextSpan(text: 'online', style: TextStyle(fontSize: 12))
              ]),
        ),
        leading: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            pop(context),
            const CircleAvatar(
              backgroundImage: NetworkImage(profImg1),
            )
          ],
        ),
      ),
      // ),
      body: Column(
        children: [
          FutureBuilder(
              future: ChatRepo().getMessage(chatId: arg.chatId),
              builder: (context, AsyncSnapshot snapshot) {
                final List<MessageModel> messages =
                    snapshot.hasData ? snapshot.data : [];
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: messages.length,
                    // reverse: true,
                    itemBuilder: (context, index) {
                      final MessageModel messege = messages[index];
                      final bool isMe = messege.senderId == currentUser;
                      // final bool issameUser =prevUsr==messege.sender;
                      //  prevUsr = messege.sender;
                      return _chatBubble(
                        messege,
                        isMe,
                      );
                    },
                  ),
                );
              }),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _pChatController,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'messages here...'),
                ),
              ),
              IconButton(
                onPressed: () async {
                  ChatRepo().addMessage(
                      message: MessageModel(
                          id: "62c1b80b6602f80c1a9",
                          chatId: "62c1b80b660280c1a954d5dc",
                          senderId: "62be900600b1aef58e50695d",
                          text: _pChatController.text,
                          name: "Arya"));
                  _pChatController.clear();
                  // sendMessage();
                },
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
