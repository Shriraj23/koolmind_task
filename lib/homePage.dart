import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:koolmind_task/screens/homeScreen.dart';
import 'package:koolmind_task/screens/profileScreen.dart';
import 'package:koolmind_task/screens/offersScreen.dart';
import 'package:koolmind_task/screens/moreDetailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        inactiveColor: Colors.blueGrey,
        activeColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.white,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            backgroundColor: Colors.white,
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            backgroundColor: Colors.white,
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            backgroundColor: Colors.white,
            label: 'More',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => const HomeScreen(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => const ProfileScreen(),
          );
        } else if (index == 2) {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => const OffersScreen(),
          );
        } else {
          return CupertinoTabView(
            navigatorKey: fourthTabNavKey,
            builder: (BuildContext context) => const MoreDetailsScreen(),
          );
        }
      },
    );
  }
}
