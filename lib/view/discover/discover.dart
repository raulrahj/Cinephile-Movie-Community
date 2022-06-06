import 'package:flutter/material.dart';
import 'package:open_box/view/discover/new_releases/new_releases.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(children: const [
            NewReleaseScreen(),
        SizedBox.expand(
          child: Text('one'),
        ),
        SizedBox.expand(
          child: Text('two'),
        )
      ])),
    );
  }
}
