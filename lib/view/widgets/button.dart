import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class DButton extends StatelessWidget {
  const DButton({
    Key? key,
    required this.isWhite,
    required this.text,
    this.function,
  }) : super(key: key);
  final bool isWhite;
  final String text;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: SizedBox(
        width: dWidth(context) * .4,
        height: 44,
        child: ElevatedButton(
            onPressed: function,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    isWhite ? kWhite : Theme.of(context).primaryColor),
                elevation: MaterialStateProperty.all(8.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius),
                      side: isWhite
                          ? const BorderSide(color: kBlack)
                          : BorderSide.none),
                )),
            child: ShadowText(
              data: text,
              isWhite: isWhite,
            )),
      ),
    );
  }
}

class ShadowText extends StatelessWidget {
  const ShadowText({
    Key? key,
    required this.data,
    required this.isWhite,
  }) : super(key: key);

  final String data;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 4.0,
            left: 2.0,
            child: Text(
              data,
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 13,
                color: isWhite ? Theme.of(context).primaryColor : kWhite,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Text(
              data,
              style: TextStyle(
                letterSpacing: 4,
                fontSize: 13,
                color: isWhite ? Theme.of(context).primaryColor : kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
