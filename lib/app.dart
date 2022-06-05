import 'package:flutter/material.dart';
import 'package:open_box/view/register/login_screen.dart';

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
      home:const Scaffold(
        // backgroundColor: Colors.amber,
        body: LoginScreen(),
      ),
    );
    
  }
}

