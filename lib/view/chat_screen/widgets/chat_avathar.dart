
import 'package:flutter/material.dart';
import 'package:open_box/config/core.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    Key? key,
    required this.radius,
  }) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: kBlack,
              spreadRadius: .5,
              blurRadius: 2,
              // blurStyle:
            )
          ],
          border: Border.all(width: .5, color: Theme.of(context).primaryColorLight)),
      child: CircleAvatar(
        backgroundImage: const NetworkImage(profImg),
        radius: radius,
      ),
    );
  }
}
