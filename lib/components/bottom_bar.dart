import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/home_page.dart';
import '../pages/forum_page.dart';
import '../style/style.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ForumPage(),
    Text('Index 1: Schedule'),
    Text('Index 3: Notification'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppStyle.homeIcon,
              color: AppStyle.primarySwatch,
            ),
            icon: SvgPicture.asset(AppStyle.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppStyle.reportIcon,
              color: AppStyle.primarySwatch,
            ),
            icon: SvgPicture.asset(AppStyle.reportIcon),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppStyle.profileIcon,
              color: AppStyle.primarySwatch,
            ),
            icon: SvgPicture.asset(AppStyle.profileIcon),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppStyle.notificationsIcon,
              color: AppStyle.primarySwatch,
            ),
            icon: SvgPicture.asset(AppStyle.notificationsIcon),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppStyle.primarySwatch,
        onTap: _onItemTapped,
      ),
    );
  }
}
