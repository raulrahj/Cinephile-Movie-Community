import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';
import 'package:open_box/view/chat_screen/widgets/chat_avathar.dart';
import 'package:open_box/view/register/otp_verification.dart';

class GroupChatView extends StatelessWidget {
  const GroupChatView({Key? key, required this.chat}) : super(key: key);
  final ChatTypes chat;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const HeadlineWidget(
            title: 'Group chats',
            color: kBlack,
          ),
          LimitedBox(
            maxHeight: 110,
            maxWidth: dWidth(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chat.groupChat!.length,
              itemBuilder: (context, index) => FutureBuilder(
                future: UserRepo()
                    .getUser(id: chat.groupChat![index].members.first),
                builder: (context, AsyncSnapshot snapshot) {
                  final UserModel data = snapshot.hasData
                      ? snapshot.data
                      : UserModel(
                          id: "4", username: "", firstname: "", lastname: "");
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/group_chat');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ChatAvatar(radius: 33.0),
                          Text(
                            data.firstname,
                            style: GoogleFonts.dmSans().copyWith(
                                fontWeight: FontWeight.bold, color: kBlack),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
