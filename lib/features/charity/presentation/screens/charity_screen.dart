import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/charity/presentation/providers/charity_provider.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class CharityScreen extends StatelessWidget {
  const CharityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) => AppHeader(
                bottomPadding: 40.h,
                subtitle: l10n.everyPurchase,
                backButtonText: l10n.backToStores,
                onBackButtonPressed: () {
                  context.goNamed(AppRouteNames.home);
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40), // Moves the widget 20 pixels up
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer(
                  builder: (context, ref, child) {
                    final lastMonthCharity = ref.watch(
                      lastMonthCharityProvider,
                    );
                    return lastMonthCharity.when(
                      loading: () => Transform.translate(
                        offset: const Offset(0, 100),
                        child: const Center(child: CircularProgressIndicator()),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
