import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/logic/cubit/search/search_cubit.dart';

class UserSResult extends StatelessWidget {
  const UserSResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) => none,
            itemCount: state.userList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final data = state.userList[index];
              return GestureDetector(
                onTap: () {
                  context.read<UserBloc>().add(LoadUserEvent(userId: data.id));
                  Navigator.pushNamed(
                    context,
                    '/user_screen',
                  );
                },
                child: Container(
                  height: dHeight(context) / 8.9,
                  // width: dWidth(context)/5,
                  color: kWhite,
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: data.profilePicture == null
                            ? CircleAvatar(
                                radius: dWidth(context) / 13.5,
                                backgroundColor:
                                    Colors.transparent.withOpacity(0.5),
                                child: const Icon(
                                  Icons.person_outline_rounded,
                                  size: 44,
                                ),
                              )
                            : CircleAvatar(
                                radius: dWidth(context) / 13.5,
                                backgroundImage: NetworkImage(
                                    "${data.profilePicture}"),
                                backgroundColor:
                                    Colors.transparent.withOpacity(0.5),
                              )),
                    Expanded(
                        flex: 7,
                        child: data.firstname == null
                            ? Text(
                                'Username',
                                style:
                                    GoogleFonts.dmSans().copyWith(fontSize: 18),
                              )
                            : Text(
                                data.firstname,
                                style:
                                    GoogleFonts.dmSans().copyWith(fontSize: 18),
                              ))
                  ]),
                ),
              );
            });
      },
    );
  }
}
