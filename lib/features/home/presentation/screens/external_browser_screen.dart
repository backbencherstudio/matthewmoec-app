import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';

class ExternalBrowserScreen extends StatelessWidget {
  const ExternalBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            subtitle: '',
            backButtonText: 'backToStores'.tr(),
            bottomPadding: 0,
            onBackButtonPressed: () {
              context.goNamed(AppRouteNames.bottomNav);
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Store Link Active Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF2F9), // Light bluish background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Store Link Active',
                      style: TextStyle(
                        color: Color(0xFF3B5B91),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Amazon Header
                  const Text(
                    'Amazon',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A68B1),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Description Text
                  const Text(
                    'As an Amazon Associate I earn from qualifying purchases.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2C3E50),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Main Donation Display Card
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
    );
  }
}
