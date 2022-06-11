
import 'package:flutter/material.dart';

class ExpWidget extends StatelessWidget {
  const ExpWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  // final Function function
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: Theme.of(context).primaryColor,
      title: Text(title),
      children: children,
    );
  }
}
