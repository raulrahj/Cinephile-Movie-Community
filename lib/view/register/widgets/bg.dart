import 'package:flutter/material.dart';
import 'package:open_box/config/core.dart';

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken),
            fit: BoxFit.cover,
            image: const NetworkImage(urlImg),
          ),
        ),
        child: widget);
  }
}
