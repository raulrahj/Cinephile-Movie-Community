import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class GroupSResult extends StatelessWidget {
  const GroupSResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => None,
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              height: dHeight(context) / 8.9,
              // width: dWidth(context)/5,
              color: kWhite,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: dWidth(context)/13,
                    height: dHeight(context)/8.9,
                    child: Icon(
                      Icons.group,
                      size: 44,
                    ),
                    color: Colors.transparent.withOpacity(0.5),
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
