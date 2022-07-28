
import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class LinearTextField extends StatelessWidget {
  const LinearTextField(
      {Key? key,
      this.hint,
      this.label,
      this.prefix,
      this.obscureText,
      this.keyType,
      this.suffix,
      this.controller,
      this.capText,
      this.onSaved,
      this.validator})
      : super(key: key);
  final String? hint;
  final String? label;
  final IconData? prefix;
  final bool? obscureText;
  final TextInputType? keyType;
  final Widget? suffix;
  final TextEditingController? controller;
  final TextCapitalization? capText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText ?? false,
        keyboardType: keyType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefix,
            color: kSecondary,
          ),
          suffix: suffix,
          prefixIconColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(borderRadius: kBorderRadius),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).iconTheme.color!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: label,
        ),
      ),
    );
  }
}
