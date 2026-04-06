import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/features/bottom_nav/presentation/providers/bottom_nav_provider.dart';
import 'package:matthewmoec_app/features/charity/presentation/screens/charity_screen.dart';
import 'package:matthewmoec_app/features/home/presentation/screens/home_screen.dart';
import 'package:matthewmoec_app/features/share/presentation/screens/share_screen.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  static const List<Widget> _screens = [
    HomeScreen(),
    CharityScreen(),
    ShareScreen(),
  ];

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
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavProvider.notifier).state = index;
        },
        items: _destinations,
      ),
    );
  }
}
