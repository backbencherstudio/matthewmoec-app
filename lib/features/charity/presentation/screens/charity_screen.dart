import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/bottom_nav/presentation/providers/bottom_nav_provider.dart';

class CharityScreen extends StatelessWidget {
  const CharityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) => AppHeader(
                bottomPadding: 40.h,
                subtitle: "everyPurchaseMakesADifference".tr(),
                backButtonText: "backToStores".tr(),
                onBackButtonPressed: () {
                  ref.read(bottomNavProvider.notifier).state = 0;
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40), // Moves the widget 20 pixels up
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(color: const Color(0xFFF0F0F0)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Last month confirmed donation',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4A68B1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '\$1,240',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A2E56),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'January 2025',
                                style: TextStyle(
                                  color: Color(0xFF4A68B1),
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: Colors.blue[300],
                                ),
                              ),
                              const Text(
                                'Red Cross',
                                style: TextStyle(
                                  color: Color(0xFF4A68B1),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
