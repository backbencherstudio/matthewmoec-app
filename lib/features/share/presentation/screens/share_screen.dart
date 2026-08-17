import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/app_config/presentation/providers/app_provider.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareScreen extends ConsumerWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return AppHeader(
                  bottomPadding: 40.h,
                  subtitle: l10n.helpOthersShopAndGiveBack,
                  backButtonText: l10n.backToCauses,
                  onBackButtonPressed: () {
                    context.goNamed(AppRouteNames.charity);
                  },
                );
              },
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: Consumer(
                builder: (context, ref, child) {
                  final appConfigAsync = ref.watch(getAppConfigProvider);
                  final appConfig = appConfigAsync.valueOrNull;
                  final String? url = Platform.isAndroid
                      ? appConfig?.androidPlayStoreUrl
                      : appConfig?.iosAppStoreUrl;
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1. Message Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.shareMessageTitle,
                                style: const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ref.watch(translatedAppConfigProvider).when(
                                data: (appConfig) => Text(
                                  appConfig.shareMessage ?? '',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                                loading: () => Shimmer.fromColors(
                                  baseColor: const Color(0xFFE8ECEF),
                                  highlightColor: const Color(0xFFF7F9FA),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 14.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        height: 14.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        height: 14.h,
                                        width: 200.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                error: (error, stackTrace) => Shimmer.fromColors(
                                  baseColor: const Color(0xFFE8ECEF),
                                  highlightColor: const Color(0xFFF7F9FA),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 14.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        height: 14.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        height: 14.h,
                                        width: 200.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "CartForGood.com",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // 2. Share Options Grid
                        Row(
                          children: [
                            _ShareOption(
                              icon: Icons.chat_bubble_outline,
                              label: l10n.methodMessage,
                              onTap: () async {
                                final String message =
                                    'Check out this awesome app! $url';

                                // 1. Manually encode the message.
                                // Uri.encodeComponent explicitly turns spaces into %20
                                final String encodedMessage =
                                    Uri.encodeComponent(message);

                                // 2. Parse the entire string into a URI manually
                                final Uri smsUri = Uri.parse(
                                  'sms:?body=$encodedMessage',
                                );

                                if (await canLaunchUrl(smsUri)) {
                                  await launchUrl(smsUri);
                                } else {
                                  debugPrint(
                                    'Could not launch the Messages app',
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            _ShareOption(
                              icon: Icons.email_outlined,
                              label: l10n.methodEmail,
                              onTap: () async {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: '',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'Check out this awesome app!',
                                    'body': 'Here is the link: $url',
                                  }),
                                );

                                await launchUrl(emailLaunchUri);
                                if (await canLaunchUrl(emailLaunchUri)) {
                                } else {
                                  debugPrint('Could not launch email client');
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _ShareOption(
                              icon: Icons.message,
                              label: l10n.methodWhatsApp,
                              onTap: () async {
                                final String message =
                                    'Hey! Check out this link: $url';

                                // Encode the message to safely handle spaces and special characters
                                final String encodedMessage =
                                    Uri.encodeComponent(message);

                                // Use the universal wa.me link
                                final Uri whatsappUri = Uri.parse(
                                  'https://wa.me/?text=$encodedMessage',
                                );

                                if (await canLaunchUrl(whatsappUri)) {
                                  await launchUrl(
                                    whatsappUri,
                                    mode: LaunchMode
                                        .externalApplication, // Forces it to open the app, not a webview
                                  );
                                } else {
                                  debugPrint('Could not launch WhatsApp');
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            _ShareOption(
                              icon: Icons.link,
                              label: l10n.methodCopyLink,
                              onTap: () async {
                                await Clipboard.setData(
                                  ClipboardData(text: url!),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Link copied to clipboard!',
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),

                        // 3. Share Now Button
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: Consumer(
                            builder: (context, ref, child) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF2B468F,
                                ), // Deep blue
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () async {
                                SharePlus.instance.share(
                                  ShareParams(
                                    text: 'Check out this link: $url',
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    l10n.shareNow,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.north_east, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}

// Custom widget for the square share buttons
class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.indigo, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
