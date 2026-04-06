import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            subtitle: 'helpOthersShop&GiveBack'.tr(),
            backButtonText: 'backToStores'.tr(),
            bottomPadding: 0,
            onBackButtonPressed: () {
              context.goNamed(AppRouteNames.bottomNav);
            },
          ),
          Container(
            width: 350, // Adjust width as needed
            padding: const EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'How It works',
                  style: TextStyle(
                    color: Color(0xFF5C79C7), // Muted blue color
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'The stores pay us a small commission when you shop through our links. You pay nothing extra. We share what they give us with charity every month.',
                  style: TextStyle(
                    color: Color(0xFF2D4373), // Dark navy text color
                    fontSize: 18,
                    height: 1.4, // Line height for readability
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
