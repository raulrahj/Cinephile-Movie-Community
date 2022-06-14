import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';

class LargeHeadlineWidget extends StatelessWidget {
  const LargeHeadlineWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth2,
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 2),
          builder: (BuildContext context, double val, child) {
            print(' :(');
            return Opacity(
              opacity: val,
              child: Padding(
                padding: EdgeInsets.only(top: val * 20),
                child: child,
              ),
            );
          },
          curve: Curves.linearToEaseOut,
          child: Text(
            title,
            style: GoogleFonts.oswald().copyWith(
                color: Theme.of(context).primaryColorLight, fontSize: 28),
          ),
        ),
      ],
    );
  }
}
