import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/routes/app_route_paths.dart';
import 'package:matthewmoec_app/features/bottom_nav/presentation/screens/bottom_nav_screen.dart';
import 'package:matthewmoec_app/features/charity/presentation/screens/charity_screen.dart';
import 'package:matthewmoec_app/features/home/presentation/screens/external_browser_screen.dart';
import 'package:matthewmoec_app/features/home/presentation/screens/home_screen.dart';
import 'package:matthewmoec_app/features/home/presentation/screens/how_it_works_screen.dart';
import 'package:matthewmoec_app/features/home/presentation/screens/store_details_screen.dart';
import 'package:matthewmoec_app/features/share/presentation/screens/share_screen.dart';
import 'package:matthewmoec_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: AppRoutePaths.splash,
    routes: [
      GoRoute(
        path: AppRoutePaths.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.bottomNav,
        name: AppRouteNames.bottomNav,
        builder: (context, state) => const BottomNavScreen(),
        routes: [
          GoRoute(
            path: AppRoutePaths.home,
            name: AppRouteNames.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: AppRoutePaths.howItWorks,
                name: AppRouteNames.howItWorks,
                builder: (context, state) => const HowItWorksScreen(),
              ),
              GoRoute(
                path: AppRoutePaths.storeDetails,
                name: AppRouteNames.storeDetails,
                builder: (context, state) => const StoreDetailsScreen(),
              ),
              GoRoute(
                path: AppRoutePaths.externalBrowser,
                name: AppRouteNames.externalBrowser,
                builder: (context, state) => const ExternalBrowserScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutePaths.charity,
            name: AppRouteNames.charity,
            builder: (context, state) => const CharityScreen(),
          ),
          GoRoute(
            path: AppRoutePaths.share,
            name: AppRouteNames.share,
            builder: (context, state) => const ShareScreen(),
          ),
        ],
      ),
    ],
  );
}
