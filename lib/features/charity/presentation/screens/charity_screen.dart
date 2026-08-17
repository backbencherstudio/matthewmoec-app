import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:matthewmoec_app/core/provider/connectivity_provider.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/charity/presentation/providers/charity_provider.dart';
import 'package:matthewmoec_app/features/charity/presentation/widgets/charity_card_shimmer.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class CharityScreen extends ConsumerStatefulWidget {
  const CharityScreen({super.key});

  @override
  ConsumerState<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends ConsumerState<CharityScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        ref.invalidate(lastMonthCharityProvider);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lastMonthCharity = ref.watch(lastMonthCharityProvider);

    // Auto re-fetch when internet connection comes back
    ref.listen<NetworkStatus>(connectivityStatusProvider, (previous, next) {
      if (previous == NetworkStatus.disconnected &&
          next == NetworkStatus.connected) {
        ref.invalidate(lastMonthCharityProvider);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        color: const Color(0xFF2B468F),
        backgroundColor: Colors.white,
        onRefresh: () async {
          ref.invalidate(lastMonthCharityProvider);
          try {
            await ref.read(lastMonthCharityProvider.future);
          } catch (_) {
            // Error is handled by Riverpod provider state & shimmer UI
          }
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              AppHeader(
                bottomPadding: 40.h,
                subtitle: l10n.everyPurchase,
                backButtonText: l10n.backToStores,
                onBackButtonPressed: () {
                  context.goNamed(AppRouteNames.home);
                },
              ),
              Transform.translate(
                offset: const Offset(0, -40), // Moves the widget 20 pixels up
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: lastMonthCharity.when(
                    loading: () => const CharityCardShimmer(),
                    error: (error, stackTrace) => const CharityCardShimmer(),
                      data: (data) => Column(
                        children: data
                            .map(
                              (charity) => Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: const Color(0xFFF0F0F0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      l10n.lastMonthShared,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF4A68B1),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      '\$${charity.donationAmount.toString()}',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1A2E56),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "${DateFormat('MMMM').format(charity.date!)} ${charity.date?.year} | ${charity.charityOrganizationName}",
                                      style: TextStyle(
                                        color: Color(0xFF4A68B1),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
