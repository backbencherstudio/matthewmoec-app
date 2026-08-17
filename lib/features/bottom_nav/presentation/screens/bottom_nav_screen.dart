import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/widgets/connectivity_bottom_banner.dart';
import 'package:matthewmoec_app/core/widgets/double_tap_to_exit.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class BottomNavScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<BottomNavigationBarItem> destinations = [
      BottomNavigationBarItem(
        icon: Image.asset("assets/icons/home.png"),
        activeIcon: Image.asset("assets/icons/home_filled.png"),
        label: l10n.navHome,
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/icons/charity.png"),
        activeIcon: Image.asset("assets/icons/charity_filled.png"),
        label: l10n.navCauses,
      ),
      BottomNavigationBarItem(
        icon: Image.asset("assets/icons/share.png"),
        activeIcon: Image.asset("assets/icons/share_filled.png"),
        label: l10n.navShare,
      ),
    ];
    return DoubleTapToExit(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: navigationShell,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const OfflineBottomBar(),
              BottomNavigationBar(
                elevation: 0,
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
                items: destinations,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
