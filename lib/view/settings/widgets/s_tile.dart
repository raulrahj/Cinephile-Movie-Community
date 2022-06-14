import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.function,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                color: kBlack,
              ),
              kWidth1,
              Text(
                title,
                style:
                    GoogleFonts.dmSans().copyWith(fontSize: 18, color: kBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
