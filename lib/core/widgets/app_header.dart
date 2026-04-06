import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matthewmoec_app/core/constants/app_color.dart';
import 'package:matthewmoec_app/core/provider/provider.dart';

class AppHeader extends ConsumerWidget {
  const AppHeader({
    super.key,
    this.backButtonText,
    this.onBackButtonPressed,
    required this.subtitle,
    this.bottomPadding,
  });

  final String? backButtonText;
  final VoidCallback? onBackButtonPressed;
  final String subtitle;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch Riverpod state to toggle the active switch color
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
            if (backButtonText != null && onBackButtonPressed != null) ...[
              8.verticalSpace,
              GestureDetector(
                onTap: onBackButtonPressed,
                child: SizedBox(
                  child: Row(
                    spacing: 5.w,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.white,
                        size: 18.sp,
                      ),
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
              ),
            ],
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/logos/side_logo.png", height: 28.h),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1D5DB), // light gray track
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: GestureDetector(
                    // Make this async so we can await setLocale
                    onTap: () async {
                      final newLocale = currentLocale.languageCode == 'en'
                          ? const Locale('es')
                          : const Locale('en');

                      // 1. Update UI and save to memory FIRST
                      await context.setLocale(newLocale);

                      // 2. Notify Riverpod SECOND
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
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              subtitle,
              style: TextStyle(fontSize: 16.sp, color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}

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
          color: isSelected
              ? Colors.white
              : const Color(0xFF6B7280), // muted gray
        ),
      ),
    );
  }
}
