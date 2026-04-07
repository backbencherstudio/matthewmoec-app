import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScreen({super.key, required this.navigationShell});

  static final List<BottomNavigationBarItem> _destinations = [
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/home.png"),
      activeIcon: Image.asset("assets/icons/home_filled.png"),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/charity.png"),
      activeIcon: Image.asset("assets/icons/charity_filled.png"),
      label: 'Charity',
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/share.png"),
      activeIcon: Image.asset("assets/icons/share_filled.png"),
      label: 'Share',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: _destinations,
      ),
    );
  }
}
