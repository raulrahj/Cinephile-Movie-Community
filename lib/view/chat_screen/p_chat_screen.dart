// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/data/util/date_parse.dart';
import 'package:open_box/infrastructure/chat/chat_repo.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/chat_screen/widgets/chat_bubble.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// class PChatArg {
//   final UserModel userData;
//   final String chatId;
//   // final List<MessageModel>? chatdata;
//   PChatArg({required this.chatId, required this.userData});
// }

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
    // final arg = ModalRoute.of(context)?.settings.arguments as PChatArg;
    String currentUser = '';
   

    return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      final List<MessageModel> messages = state.connectedUserChat;
      currentUser = state.currentUser.user!.id!;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          // centerTitle: true,
          title: Row(
            children: [
              CircleAvatar(
                radius: dWidth(context) / 20,
                backgroundImage: NetworkImage(
                    state.connectedUser.profilePicture == null
                        ? profImg1
                        : "$kApiImgUrl/${state.connectedUser.profilePicture}"),
              ),
              kWidth2,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: state.connectedUser.firstname,
                  style: GoogleFonts.dmSans().copyWith(fontSize: 18),
                  // children: const [
                  //   TextSpan(text: '\n'),
                  //   TextSpan(text: '', style: TextStyle(fontSize: 12))
                  // ]
                ),
              ),
            ],
          ),
          leading: pop(context),
        ),
        // );
        // },
        // ),
        body: Column(
          children: [
            // FutureBuilder(
            //     future: ChatRepo().getMessages(chatId: cha.chatId),
            //     builder: (context, AsyncSnapshot snapshot) {
            // snapshot.hasData ? snapshot.data : [];
            // return
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                // reverse: true,
                itemBuilder: (context, index) {
                  final MessageModel messege = messages[index];
                  final bool isMe = messege.senderId == currentUser;
                  // final bool issameUser =prevUsr==messege.sender;
                  //  prevUsr = messege.sender;
                  return chatBubble(
                    messege,
                    isMe,
                    context
                  );
                },
              ),
            ),
            // }),
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
                    if (state.chatInfo.id == null ||
                        _pChatController.text.isEmpty) return;
                    await ChatRepo().addMessage(
                        message: MessageModel(
                            id: DateTime.now().toString(),
                            chatId: state.chatInfo.id!,
                            senderId: state.currentUser.user!.id!,
                            text: _pChatController.text,
                            name: state.currentUser.user!.firstname));
                    context.read<ChatCubit>().getMessages(
                        chatId: state.chatInfo.id!,
                        clientId: state.connectedUser.id);
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
    });
  }
}
