
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/search_screen/search_screen.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

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
class NavController extends StatefulWidget {
  NavController({Key? key}) : super(key: key);

  @override
  State<NavController> createState() => _NavControllerState();
}

class _NavControllerState extends State<NavController> {
    int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   bottomNavigationBar: CustomNavigationBar(
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
          icon: const Icon(Icons.message_sharp),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.search),
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
      body: SearchScreen(),
    );
  }
}