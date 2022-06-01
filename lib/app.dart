import 'package:flutter/material.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Open Box",
      home: Scaffold(
        body: ProgressCircle(),
      ),
    );
    
  }
}

