
import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.background,
    this.function,
  }) : super(key: key);
  final Widget text;
  final Color? background;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        width: dWidth(context),
        height: 50,
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                background ?? Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: kBorderRadius,
                // side: const BorderSide(color: Colors.red)
              ),
            ),
          ),
          child: text,
        ),
      ),
    );
  }
}
