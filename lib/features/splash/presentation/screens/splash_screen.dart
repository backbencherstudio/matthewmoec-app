import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/features/splash/presentation/providers/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  static const Color navyBlue = Color(0xFF1A2B6B);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _progressAnimation.addListener(() {
      ref
          .read(splashProvider.notifier)
          .updateProgress(_progressAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });

    _controller.forward();
  }

  void _navigateToNextScreen() {
    context.goNamed(AppRouteNames.bottomNav);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/logo.png',
                width: 218,
                height: 110,
                fit: BoxFit.cover,
              ),
              8.verticalSpace,
              Text(
                'slogan'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5A6A9A),
                  letterSpacing: 0.1,
                ),
              ),
              40.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Consumer(
                  builder: (context, ref, child) {
                    final progress = ref.watch(splashProvider);
                    return LinearProgressIndicator(
                      value: progress, // Driven by Riverpod state
                      minHeight: 5,
                      backgroundColor: const Color(0xFFDDDDDD),
                      valueColor: const AlwaysStoppedAnimation<Color>(navyBlue),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
