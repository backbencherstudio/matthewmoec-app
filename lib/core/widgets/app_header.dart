import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matthewmoec_app/core/constants/app_color.dart';
import 'package:matthewmoec_app/core/provider/provider.dart';

enum AppHeaderMode {
  appLogo, // Shows side_logo.png (cases 1 & 2)
  storeLogo, // Shows store image + store name (cases 3 & 4)
}

class AppHeader extends ConsumerWidget {
  const AppHeader({
    super.key,
    this.backButtonText,
    this.onBackButtonPressed,
    required this.subtitle,
    this.bottomPadding,
    this.mode = AppHeaderMode.appLogo,
    this.storeLogoPath,
    this.storeName,
    this.showLocaleToggle = true,
  }) : assert(
         mode == AppHeaderMode.appLogo ||
             (storeLogoPath != null && storeName != null),
         'storeLogo mode requires storeLogoPath and storeName',
       );

  final String? backButtonText;
  final VoidCallback? onBackButtonPressed;
  final String subtitle;
  final double? bottomPadding;
  final AppHeaderMode mode;
  final bool showLocaleToggle;

  /// Asset path or network URL for the store logo (used in storeLogo mode)
  final String? storeLogoPath;

  /// Store name displayed next to the store logo (used in storeLogo mode)
  final String? storeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: bottomPadding ?? 24.h,
      ),
      decoration: BoxDecoration(gradient: AppColor.linearGradient),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Back button ──────────────────────────────────────────────
            if (backButtonText != null && onBackButtonPressed != null) ...[
              8.verticalSpace,
              GestureDetector(
                onTap: onBackButtonPressed,
                child: Row(
                  spacing: 5.w,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back, color: AppColor.white, size: 18.sp),
                    Text(
                      backButtonText!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            20.verticalSpace,

            // ── Logo row ─────────────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: app logo OR store logo + name
                if (mode == AppHeaderMode.appLogo)
                  Image.asset("assets/logos/side_logo.png", height: 28.h)
                else
                  Expanded(
                    child: Row(
                      spacing: 12.w,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Store logo — supports asset paths and network URLs
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: storeLogoPath!.startsWith('http')
                              ? Image.network(
                                  storeLogoPath!,
                                  width: 40.w,
                                  height: 40.w,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  storeLogoPath!,
                                  width: 40.w,
                                  height: 40.w,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        // Store name
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                storeName!,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                subtitle,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (showLocaleToggle)
                  // Right side: EN / ES toggle (always shown)
                  _LocaleToggle(currentLocale: currentLocale, ref: ref),
              ],
            ),

            // ── Subtitle ─────────────────────────────────────────────────
            if (mode == AppHeaderMode.appLogo) ...[
              8.verticalSpace,
              Text(
                subtitle,
                style: TextStyle(fontSize: 16.sp, color: AppColor.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Locale toggle extracted for clarity ────────────────────────────────────

class _LocaleToggle extends StatelessWidget {
  const _LocaleToggle({required this.currentLocale, required this.ref});

  final Locale currentLocale;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
          final currentLocale = ref.read(localeProvider);
          final newLocale = currentLocale.languageCode == 'en'
              ? const Locale('es')
              : const Locale('en');

          ref.read(localeProvider.notifier).updateLocale(newLocale);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ToggleOption(
              label: 'EN',
              isSelected: currentLocale.languageCode == 'en',
            ),
            _ToggleOption(
              label: 'ES',
              isSelected: currentLocale.languageCode == 'es',
            ),
          ],
        ),
      ),
    );
  }
}

// ── Single toggle pill ──────────────────────────────────────────────────────

class _ToggleOption extends StatelessWidget {
  const _ToggleOption({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 36,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.navyBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          color: isSelected ? Colors.white : const Color(0xFF6B7280),
        ),
      ),
    );
  }
}
