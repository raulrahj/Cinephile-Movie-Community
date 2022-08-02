// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
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
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  late IO.Socket socket;
  void connectToServer() {
    try {
      // Configure socket transports must be sepecified
      socket = IO.io('http://192.168.43.244:8800', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });

      // Connect to websocket
      socket.connect();
      socket.emit('connection', socket);
      print("print socket is disconnected :${socket.disconnected}");
      // socket!.emit("")
      socket.on('connect', (data) {
        print(socket.connected);
      });
      socket.emit('connection', socket);

      print(
          'FFFFFFFFFuuuuuuuuuuccccccccccckkkkkkkkkkkkk ooooooooooooooffffffffffffffffff');
      //listen for incoming messages from the Server.
      socket.on('message', (data) {
        print(data); //
      });
//new user add
      socket.on('new-user-add', (data) {
        print(data); //
      });
      //listens when the client is disconnected from the Server
      socket.on('disconnect', (data) {
        print('disconnect');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Send update of user's typing status
  sendTyping(bool typing) {
    socket.emit("typing", {
      "id": socket.id,
      "typing": typing,
    });
  }

  // Listen to update of typing status from connected users
  void handleTyping(Map<String, dynamic> data) {
    print(data);
  }

  // Send a Message to the server
  sendMessage(String message) {
    socket.emit(
      "send-message",
      {
        "id": socket.id,
        "message": message, // Message to be sent
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  // Listen to all message events from connected users
  void handleMessage(Map<String, dynamic> data) {
    print(data);
  }

  @override
  void initState() {
    _pChatController = TextEditingController();
    super.initState();
    connectToServer();
    socket.emit('new-user-add', {"newUserId": "1234"});
    print(
        'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGgg');
  }

  @override
  void dispose() {
    super.dispose();
    // socket!.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
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
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                // reverse: true,
                itemBuilder: (context, index) {
                  final MessageModel messege = messages[index];
                  final bool isMe = messege.senderId == currentUser;
                  // final bool issameUser =prevUsr==messege.sender;
                  //  prevUsr = messege.sender;
                  return chatBubble(messege, isMe, context);
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
                    socket.emit('connection', socket);
                    socket.emit('new-user-add', {"newUserId":"q23423"});

                    socket.on('new-user-add', (data) {
                      print(data); //
                    });
                    print('what the fuck is happenng');
                    print(socket.connected);
                    sendMessage(_pChatController.text);
                    if (state.chatInfo.id == null ||
                        _pChatController.text.isNotEmpty) return;
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
