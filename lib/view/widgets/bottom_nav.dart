import 'dart:developer';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:open_box/view/chat_screen/inbox_screen.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/view/discover/discover.dart';
import 'package:open_box/view/discover/trending/trending_screen.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/view/search_screen/search_screen.dart';
import 'package:open_box/view/settings/settings.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings')
        ]);
  }
}

class NavController extends StatefulWidget {
  const NavController({Key? key}) : super(key: key);
  @override
  State<NavController> createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    SearchScreen(),
    InboxScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    log('nav bar rebuild :(');

    return Scaffold(
      bottomNavigationBar: isFull
          ? none
          : CustomNavigationBar(
              elevation: 0.0,
              iconSize: 30.0,
              selectedColor: Theme.of(context).iconTheme.color,
              strokeColor: Theme.of(context).primaryColorLight,
              unSelectedColor: Colors.white,
              backgroundColor: kBlack,
              // blurEffect: true,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home_filled),
                ),
                CustomNavigationBarItem(
                  showBadge: true,
                  badgeCount: 3,
                  icon: const Icon(Icons.whatshot),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.search),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.messenger_outline_rounded),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
      body: _pages[_currentIndex],
    );
  }
}
