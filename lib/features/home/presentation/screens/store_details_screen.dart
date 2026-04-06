import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              subtitle: 'amazon.com/?tag-affliate_id',
              bottomPadding: 0,
              backButtonText: 'backToStores'.tr(),
              onBackButtonPressed: () {
                context.goNamed(AppRouteNames.bottomNav);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildInfoCard(
                    title: 'How it works',
                    content: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFF1A2E56),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Tap below — Amazon opens via affiliate link. Your purchase supports charity at no extra cost to you.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. Store Links Card
                  _buildInfoCard(
                    title: 'Store links',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2E4EB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Store Link Active',
                            style: TextStyle(
                              color: Color(0xFF1A2E56),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'As an Amazon Associate I earn from qualifying purchases.',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. Charity Card
                  _buildInfoCard(
                    title: 'This month’s charity',
                    child: Row(
                      children: const [
                        Text(
                          'Red Cross',
                          style: TextStyle(
                            color: Color(0xFF1A2E56),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.circle,
                            size: 6,
                            color: Color(0xFF1A2E56),
                          ),
                        ),
                        Text(
                          'January 2025',
                          style: TextStyle(
                            color: Color(0xFF1A2E56),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. Gradient Button
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF4A69BD), Color(0xFF1A2E56)],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed(AppRouteNames.externalBrowser);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Open Amazon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Opens in external browser - NOT WebView',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the grey background cards
  Widget _buildInfoCard({
    required String title,
    Widget? content,
    Widget? child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF5C7BCF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          content ?? child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
