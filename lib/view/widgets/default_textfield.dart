
import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    this.hint,
    this.label,
    this.prefix,
    this.obscureText,
    this.keyType,
    this.suffix,
  }) : super(key: key);
  final String? hint;
  final String? label;
  final Widget? prefix;
  final bool? obscureText;
  final TextInputType? keyType;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Material(
        borderRadius: kBorderRadius,
        elevation: 3,
        child: TextFormField(
          obscureText: obscureText ?? false,
          keyboardType: keyType,
          decoration: InputDecoration(
              prefixIcon: prefix,
              suffix: suffix,
              prefixIconColor: Theme.of(context).primaryColor,
              border: OutlineInputBorder(borderRadius: kBorderRadius),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColorLight),
                  borderRadius: kBorderRadius),
              filled: true,
              fillColor: Theme.of(context).primaryColorLight,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              labelText: label,
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: .6, color: Theme.of(context).primaryColor),
                  borderRadius: kBorderRadius)),
        ),
      ),
    );
  }
}
