import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class UserSResult extends StatelessWidget {
  const UserSResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => none,
        itemCount: 3,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){},
            child: Container(
              height: dHeight(context) / 8.9,
              // width: dWidth(context)/5,
              color:kWhite,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: CircleAvatar(
                    radius: dWidth(context) / 13.5,
                    child: Icon(Icons.person_outline_rounded,size: 44,),
                    backgroundColor: Colors.transparent.withOpacity(0.5),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Text(
                      'Username',
                      style: GoogleFonts.dmSans().copyWith(fontSize: 18),
                    ))
              ]),
            ),
          );
        });
  }
}
