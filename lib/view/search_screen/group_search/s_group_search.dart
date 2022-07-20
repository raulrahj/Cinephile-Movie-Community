import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class GroupSResult extends StatelessWidget {
  const GroupSResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => none,
        itemCount: 1,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              height: dHeight(context) / 8.9,
              // width: dWidth(context)/5,
              color: kWhite,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: dWidth(context) / 13,
                    height: dHeight(context) / 8.9,
                    color: Colors.transparent.withOpacity(0.5),
                    child: const Icon(
                      Icons.group,
                      size: 44,
                    ),
                  ),
                ),kWidth1,
                Expanded(
                    flex: 7,
                    child: Text(
                      'GroupName',
                      style: GoogleFonts.dmSans().copyWith(fontSize: 18),
                    ))
              ]),
            ),
          );
        });
  }
}
