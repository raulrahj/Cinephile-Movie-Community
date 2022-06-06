
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black.withOpacity(0.1),
      items:const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Settings')
    ]);
  }
}