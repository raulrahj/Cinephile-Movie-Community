// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:emoji_keyboard_flutter/emoji_keyboard_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/chat/m_message.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/infrastructure/chat/chat_repo.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/widgets/common.dart';
import 'package:open_box/view/chat_screen/widgets/chat_bubble.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

// class PChatArg {
//   final UserModel userData;
//   final String chatId;
//   // final List<MessageModel>? chatdata;
//   PChatArg({required this.chatId, required this.userData});
// }

class PChatScreen extends StatefulWidget {
  const PChatScreen(
      {Key? key,
      required this.receiverID,
      required this.userID,
      required this.chatID})
      : super(key: key);
  final String userID;
  final String receiverID;
  final String chatID;
  @override
  State<PChatScreen> createState() => _PChatScreenState();
}

class _PChatScreenState extends State<PChatScreen> {
  final _socketResponse = StreamController<MessageModel>();
  List<MessageModel> messages = [];
  late TextEditingController _pChatController;
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  late IO.Socket socket;
  late String recieverSocketID = '';
  late List<ActiveUser> activeUsers = [];
  bool isOnline = false;
  void connectToServer() async {
    try {
      // Configure socket transports must be sepecified
      socket =
          IO.io('https://cinephile-socket.herokuapp.com/', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });

      // Connect to websocket
      socket.connect();
      socket.onConnect((data) => print('connected to the Socket Server'));
      print("print socket is disconnected :${socket.disconnected}");
      socket.on('connect', (data) {
        print(socket.connected);
        socket.emit('new-user-add', widget.userID);
        socket.on("get-users", (data) {
          final resp = activeUserFromJson(jsonEncode(data));
          if (resp.isNotEmpty) {
            log("THE FILTERED LIST OF ACTIVE USERS ${resp.first.socketId}");
            activeUsers = resp;
          }
        });
        socket.on('new-user-add', (data) {
          print(data);
        });
      });
      socket.on('recieve-message', (data) {
        print(data);

        final MessageModel res = MessageModel.fromJson(jsonDecode(data));
        _socketResponse.sink.add(res);
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
  sendMessage(String message, String recieverSocketID) {
    Map<String, dynamic> req = {
      "_id": DateTime.now().millisecondsSinceEpoch.toString(),
      "chatId": widget.chatID,
      "senderId": widget.userID,
      "name": "name",

      "text": message, // Message to be sent
      "createdAt": DateTime.now().toIso8601String(),
      "updatedAt": DateTime.now().toIso8601String(),

      "recieverId": recieverSocketID,
      "recieverUserId": widget.receiverID
    };
    setState(() {
      messages.add(MessageModel.fromJson(req));
    });

    socket.emit("send-message", jsonEncode(req));
  }

  // Listen to all message events from connected users
  void handleMessage(data) {
    print(data);
  }

  @override
  void initState() {
    isOnline=true;
    _pChatController = TextEditingController();
    context
        .read<ChatCubit>()
        .getMessages(chatId: widget.chatID, clientId: widget.userID);
    super.initState();
    connectToServer();
    _socketResponse.stream.listen((event) {
      print("INSIDE STREAM LISTENER");
      print(event.text);
      setState(() {
        messages.add(event);
      });
    }, cancelOnError: false);
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

    // socket.emit('new-user-add', {"newUserId": "122234"});
  }

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
    socket.dispose();
    _socketResponse.close();
  }

  @override
  Widget build(BuildContext context) {
    log('BUILD fUCNCTION CALLING........................................................');
    //  _socketResponse.sink.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    // final arg = ModalRoute.of(context)?.settings.arguments as PChatArg;
    String currentUser = '';

    return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      if (isOnline) {
        log('BLOC BUILDER CALLING......................');
        messages.clear();
        messages.addAll(state.connectedUserChat);
      }
      print(messages);
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
                        : "${state.connectedUser.profilePicture}"),
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
                  log('ITEM BUILDER CALLING................');
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
                  onPressed: () {
                    EmojiKeyboard(
                        emotionController: _pChatController,
                        emojiKeyboardHeight: 400,
                        showEmojiKeyboard: true,
                        darkMode: true);
                  },
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
                    if (activeUsers.isNotEmpty) {
                      for (var map in activeUsers) {
                        if (activeUsers.isEmpty) break;
                        if (map.userId == widget.receiverID) {
                          recieverSocketID = map.socketId;
                          break;
                        } else {
                          recieverSocketID = '';
                          isOnline = false;
                        }
                      }
                    }
                    final message = MessageModel(
                      id: DateTime.now().toString(),
                      chatId: widget.chatID,
                      senderId: state.currentUser.user!.id!,
                      text: _pChatController.text,
                      name: state.currentUser.user!.firstname,
                    );

                    if (state.chatInfo.id == null ||
                        _pChatController.text.isEmpty) return;
                    if (recieverSocketID != '') {
                      sendMessage(_pChatController.text, recieverSocketID);
                    } else {
                      setState(() {
                        messages.add(message);

                      });
                    }

                    await ChatRepo().addMessage(
                      message: message,
                    );
                    // ignore: use_build_context_synchronously
                    // context.read<ChatCubit>().getMessages(
                    //     chatId: state.chatInfo.id!,
                    //     clientId: state.connectedUser.id);
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
