import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/cubit/chat/chat_cubit.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';
import 'package:open_box/view/chat_screen/p_chat_screen.dart';
import 'package:open_box/view/chat_screen/widgets/chat_avathar.dart';
import 'package:open_box/view/register/otp_verification.dart';

class PersonalChatView extends StatelessWidget {
  const PersonalChatView({Key? key, required this.chat}) : super(key: key);
  final ChatTypes chat;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const HeadlineWidget(
            title: 'Personal chats',
            color: kBlack,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: chat.perSonalChat!.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: UserRepo().getUser(
                    id: chat.perSonalChat![index].members.first ==
                            "62be900600b1aef58e50695d"
                        ? chat.perSonalChat![index].members.last
                        : chat.perSonalChat![index].members.first),
                builder: (context, AsyncSnapshot snapshot) {
                  final chaat = chat.perSonalChat![index];
                  final UserModel data = snapshot.hasData
                      ? snapshot.data
                      : UserModel(
                          id: "4", username: "", firstname: "", lastname: "");
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ChatCubit>()
                          .getMessages(chatId: chaat.id, clientId: data.id);
                      Navigator.pushNamed(context, '/personal_chat',
                          // arguments: PChatArg(
                          //     chatId: "62c1b80b660280c1a954d5dc",
                          //     userData: data)
                              );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      width: dWidth(context),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ChatAvatar(
                            imgUrl: profImg1,
                            radius: 25.0,
                          ),
                          kWidth1,
                          SizedBox(
                            width: dWidth(context) * .75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      data.firstname,
                                      style: GoogleFonts.dmSans().copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: kTextBlack,
                                      ),
                                    ),
                                    const Text('message')
                                  ],
                                ),
                                const Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
