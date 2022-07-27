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
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
        margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 28,
          ),
          title: Text(
            title,
            style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.black,
          ),
          onTap: function,
        ),
      ),
    );
  }
}
