import 'package:flutter/material.dart';
import 'package:open_box/view/chat_screen/chat_screen.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';
import 'package:open_box/view/discover/discover.dart';
import 'package:open_box/view/discover/new_releases/new_releases.dart';
import 'package:open_box/view/home/comment_screen.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/view/profile_screen/profile_edit.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/register/widgets/bottom_nav.dart';
import 'package:open_box/view/search_screen/search_screen.dart';
import 'package:open_box/view/settings/settings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Open Box",
      theme: ThemeData(
        primaryColor:const Color(0xFF1C306D),
        primaryColorLight: const Color(0xFFBBC1D3),
        iconTheme:const IconThemeData(color: Color(0xFFFFAD32)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor))
      ),
      home:ChatScreen(),
    );
    
  }
}

