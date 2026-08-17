import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matthewmoec_app/core/provider/connectivity_provider.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class OfflineBottomBar extends ConsumerWidget {
  const OfflineBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isConnectedProvider);
    final l10n = AppLocalizations.of(context);

    final noInternetTitle = l10n?.noInternetConnection ?? 'No internet connection';
    final noInternetMessage = l10n?.checkInternetMessage ?? 'Please check your network and try again.';

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isOnline
          ? const SizedBox(width: double.infinity, height: 0)
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFD32F2F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.wifi_off_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noInternetTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          noInternetMessage,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 11,
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
}
