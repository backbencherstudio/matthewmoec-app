import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/charity/presentation/providers/charity_provider.dart';
import 'package:matthewmoec_app/features/home/domain/entities/store_entity.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class ExternalBrowserScreen extends StatelessWidget {
  const ExternalBrowserScreen({super.key, required this.store});

  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          AppHeader(
            showLocaleToggle: false,
            backButtonText: l10n.backToStores,
            onBackButtonPressed: () => context.goNamed(AppRouteNames.home),
            mode: AppHeaderMode.storeLogo,
            storeLogoPath: 'assets/images/amazon.png',
            storeName: store.name,
            subtitle: store.link!,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store Link Active Badge
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFEDF2F9,
                        ), // Light bluish background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        l10n.storeLinkActive,
                        style: TextStyle(
                          color: Color(0xFF3B5B91),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Amazon Header
                    Text(
                      store.name!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A68B1),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Description Text
                    Text(
                      store.subTextNote!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2C3E50),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Consumer(
                      builder: (context, ref, child) {
                        final lastMonthCharity = ref.watch(
                          lastMonthCharityProvider,
                        );
                        return lastMonthCharity.when(
                          loading: () => Transform.translate(
                            offset: const Offset(0, 100),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          error: (error, stackTrace) =>
                              Center(child: Text('Error: $error')),
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
                                          color: Colors.black.withOpacity(0.05),
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
                                          l10n.lastMonthConfirmedDonation,
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
