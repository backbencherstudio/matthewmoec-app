import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matthewmoec_app/core/provider/provider.dart';
import 'package:matthewmoec_app/core/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    // 1. ProviderScope goes on the outside
    ProviderScope(
      // 2. EasyLocalization goes on the inside
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('es')],
        path: 'assets/localization',
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final easyLocale = context.locale;
    
    // Sync Riverpod to match whatever EasyLocalization loaded from memory
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(localeProvider) != easyLocale) {
        ref.read(localeProvider.notifier).updateLocale(easyLocale);
      }
    });

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale, // Use context.locale so the app auto-rebuilds
        title: "CartForGood",
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}