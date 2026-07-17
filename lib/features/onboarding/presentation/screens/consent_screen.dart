import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/constants/app_color.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/double_tap_to_exit.dart';
import 'package:matthewmoec_app/features/onboarding/presentation/providers/consent_provider.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class ConsentScreen extends ConsumerWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isAccepted = ref.watch(consentAcceptedProvider);

    return DoubleTapToExit(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.consentTitle,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.navyBlue,
                ),
                textAlign: TextAlign.center,
              ),
              40.verticalSpace,
              // Privacy Policy Link
              _buildLinkButton(
                context,
                title: l10n.consentPrivacyPolicy,
                url: 'https://cartforgood.com/privacy-policy',
                icon: Icons.privacy_tip_outlined,
              ),
              16.verticalSpace,
              // Terms & Conditions Link
              _buildLinkButton(
                context,
                title: l10n.consentTerms,
                url: 'https://cartforgood.com/terms-and-condition',
                icon: Icons.description_outlined,
              ),
              16.verticalSpace,
              // Support & FAQ Link
              _buildLinkButton(
                context,
                title: l10n.consentSupport,
                url: 'https://cartforgood.com/support-and-faq',
                icon: Icons.help_outline,
              ),
              
              const Spacer(),

              // Checkbox and Agreement Text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      value: isAccepted,
                      activeColor: AppColor.navyBlue,
                      onChanged: (value) {
                        ref.read(consentAcceptedProvider.notifier).state = value ?? false;
                      },
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      l10n.consentAgreement,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
              
              // Next Button
              ElevatedButton(
                onPressed: isAccepted
                    ? () async {
                        await ref.read(consentStorageProvider).setConsentAccepted(true);
                        if (context.mounted) {
                          context.goNamed(AppRouteNames.home);
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.navyBlue,
                  disabledBackgroundColor: Colors.grey.shade300,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  l10n.consentNext,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isAccepted ? Colors.white : Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildLinkButton(
    BuildContext context, {
    required String title,
    required String url,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRouteNames.webview,
          extra: {'title': title, 'url': url},
        );
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColor.navyBlue),
            16.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
