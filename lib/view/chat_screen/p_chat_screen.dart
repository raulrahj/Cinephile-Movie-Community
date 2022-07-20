// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/data/models/messegemodel.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PChatArg {
  final List<Messege>? chatdata;
  PChatArg({this.chatdata});
}

class PChatScreen extends StatefulWidget {
  const PChatScreen({Key? key}) : super(key: key);

  @override
  State<PChatScreen> createState() => _PChatScreenState();
}

class _PChatScreenState extends State<PChatScreen> {
  IO.Socket? socket;
  void initSocket() {
    socket = IO.io("http://192.168.1.200:8800", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    }
        // IO.OptionBuilder()
        // .setTransports(['websocket']) // for Flutter or Dart VM
        // .disableAutoConnect()  // disable auto-connection
        // .setExtraHeaders({'foo': 'bar'}) // optional
        // .build()
        );
    socket!.connect();
    // socket!.onconnect(() {
    //   // ignore: avoid_print;
    //   print("Connected");
    // });
    socket!.on("connect", (data) {
      print(data);
    });
    socket!.on("send-message", (data) {
      print(data);
    });
    socket!.on("new-user-add", (id) {
      print(id);
    });
  }

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  void sendMessage() {
    socket!.emit("send-message" "message");
  }

  @override
  void dispose() {
    super.dispose();
    socket!.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as PChatArg;
    const currentUser = 'Mac';
    _chatBubble(Messege messege, bool isMe) {
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
                  borderRadius: BorderRadius.circular(kRadius),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  messege.messege,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  messege.time,
                  style: const TextStyle(color: Colors.black54),
                ),
                kWidth1,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5))
                      ]),
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
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kRadius),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Text(messege.messege),
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
                    radius: 10,
                  ),
                ),
                kWidth1,
                Text(
                  messege.time,
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
              text: 'User',
              style: GoogleFonts.dmSans().copyWith(fontSize: 18),
              children: const [
                TextSpan(text: '\n'),
                TextSpan(text: 'online', style: TextStyle(fontSize: 12))
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
              itemCount: arg.chatdata!.length,
              // reverse: true,
              itemBuilder: (context, index) {
                final Messege messege = arg.chatdata![index];
                final bool isMe = messege.sender == currentUser;
                // final bool issameUser =prevUsr==messege.sender;
                //  prevUsr = messege.sender;
                return _chatBubble(
                  messege,
                  isMe,
                );
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
              decoration:
                  const InputDecoration.collapsed(hintText: 'messages here...'),
            )),
            IconButton(
                onPressed: () {
                  sendMessage();
                },
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
