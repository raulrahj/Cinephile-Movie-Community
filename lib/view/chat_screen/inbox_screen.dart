import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/data/models/chat/m_chat.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/chat_screen/widgets/group_chat_view.dart';
import 'package:open_box/view/chat_screen/widgets/personal_chat_view.dart';
import 'package:open_box/view/widgets/placeholders.dart';

StreamController streamController = StreamController();

class ChatTypes {
  final List<ChatsModel>? groupChat;
  final List<ChatsModel>? perSonalChat;

  ChatTypes({this.groupChat, this.perSonalChat});
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
    context.read<ChatCubit>().getUserChats();
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
          child: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        final ChatTypes chat = state.userChats;
        if (state.isLoading) {
          return const PListViewWidget();
        } else {
          return InboxChatView(
            chat: chat,
            currentUser: state.currentUser,
          );
        }
      })),
    );
  }
}

class InboxChatView extends StatelessWidget {
  const InboxChatView({Key? key, required this.chat, required this.currentUser})
      : super(key: key);

  final ChatTypes chat;
  final ProfileModel currentUser;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<ChatCubit>().getUserChats(),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8),
            child: CupertinoSearchTextField(),
          ),
          chat.groupChat!.isEmpty ? none : GroupChatView(chat: chat),
          chat.perSonalChat!.isEmpty
              ? none
              : PersonalChatView(
                  chat: chat,
                  currentUser: currentUser,
                )
        ],
      ),
    );
  }
}
