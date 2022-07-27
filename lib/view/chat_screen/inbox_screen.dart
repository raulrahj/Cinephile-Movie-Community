import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_box/data/models/chat/m_chat.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/chat/chat_repo.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/view/chat_screen/widgets/group_chat_view.dart';
import 'package:open_box/view/chat_screen/widgets/personal_chat_view.dart';

StreamController streamController = StreamController();

class ChatTypes {
  final List<ChatsModel> groupChat;
  final List<ChatsModel> perSonalChat;

  ChatTypes(this.groupChat, this.perSonalChat);
}

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<ChatModel> personalList = [];
  List<ChatModel> groupList = [];

  late Timer _timer;
  @override
  void initState() {
    // ChatRepo().userChats(userId: "62be900600b1aef58e50695d");
    // _timer = Timer.periodic(const Duration(seconds: 5),
    // (timer) => ChatRepo().userChats(userId: "62be900600b1aef58e50695d"));
    super.initState();
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Inbox'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: ChatRepo().userChats(userId: "/62be900600b1aef58e50695d"),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            final ChatTypes chat =
                snapshot.hasData ? snapshot.data : ChatTypes([], []);

            print("FUTURE COMPLETED");

            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                  child: CupertinoSearchTextField(),
                ),
                chat.groupChat.isEmpty ? none : GroupChatView(chat: chat),
                chat.perSonalChat.isEmpty ? none : PersonalChatView(chat: chat)
              ],
            );
          },
        ),
      ),
    );
  }

  Future<UserModel> getChatUser({required String id}) async {
    final resp = await UserRepo().getUser(id: id);
    return resp!;
  }

  Future<ChatTypes> getChatType({required List<ChatsModel> chats}) async {
    ChatTypes types = ChatTypes([], []);
    for (ChatsModel element in chats) {
      if (element.members.length <= 2) {
        types.perSonalChat.add(element);
      } else {
        types.groupChat.add(element);
      }
    }
    return types;
  }
}
