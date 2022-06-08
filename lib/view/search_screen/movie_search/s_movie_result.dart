import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class MovieSResult extends StatelessWidget {
  const MovieSResult({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              height: dHeight(context) / 8.9,
              // width: dWidth(context)/5,
              color: kWhite,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: dWidth(context)/13,
                    height: dHeight(context)/8.9,
                    color: kBlack,
                    child: const Icon(
                      Icons.group,
                      size: 44,
                    ),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Text(
                      'Movie Name',
                      style: GoogleFonts.dmSans().copyWith(fontSize: 18),
                    ))
              ]),
            ),
          );
        });
  }
}
