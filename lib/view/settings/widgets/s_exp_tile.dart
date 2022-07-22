import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/core.dart';

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
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      collapsedTextColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      children: children,
    );
  }
}

// Container defaultTile() {
//   return 
// }
