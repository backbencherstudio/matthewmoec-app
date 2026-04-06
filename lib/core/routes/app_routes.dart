import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/routes/app_route_paths.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: AppRoutePaths.splash,
    routes: [
      GoRoute(
        path: AppRoutePaths.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutePaths.bottomNav,
        name: AppRouteNames.bottomNav,
        builder: (context, state) => const Placeholder(),
        routes: [
          GoRoute(
            path: AppRoutePaths.home,
            name: AppRouteNames.home,
            builder: (context, state) => const Placeholder(),
            routes: [
              GoRoute(
                path: AppRoutePaths.howItWorks,
                name: AppRouteNames.howItWorks,
                builder: (context, state) => const Placeholder(),
              ),
              GoRoute(
                path: AppRoutePaths.storeDetails,
                name: AppRouteNames.storeDetails,
                builder: (context, state) => const Placeholder(),
              ),
              GoRoute(
                path: AppRoutePaths.externalBrowser,
                name: AppRouteNames.externalBrowser,
                builder: (context, state) => const Placeholder(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutePaths.charity,
            name: AppRouteNames.charity,
            builder: (context, state) => const Placeholder(),
          ),
          GoRoute(
            path: AppRoutePaths.share,
            name: AppRouteNames.share,
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),
    ],
  );
}
