import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            backButtonText: l10n.backToStores,
            onBackButtonPressed: () => context.pop(),
            subtitle: l10n.helpOthersShopAndGiveBack,
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
                Text(
                  l10n.howItWorksTitle,
                  style: TextStyle(
                    color: Color(0xFF5C79C7), // Muted blue color
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.howItWorksDescription,
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
