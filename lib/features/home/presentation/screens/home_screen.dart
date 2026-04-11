import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';
import 'package:matthewmoec_app/features/app_config/presentation/providers/app_provider.dart';
import 'package:matthewmoec_app/features/home/presentation/providers/home_provider.dart';
import 'package:matthewmoec_app/features/home/presentation/widgets/store_tile.dart';
import 'package:matthewmoec_app/l10n/generated/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(subtitle: l10n.tapAStoreSupportsCharity),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.storeSelectionTitle,
                        style: TextStyle(
                          color: Color(0xFF1A3673),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          context.pushNamed(AppRouteNames.howItWorks);
                        },
                        icon: const Icon(Icons.info_outline, size: 18),
                        label: Text(l10n.howItWorksTitle),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFDDE7F8),
                          shape: StadiumBorder(),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  ref
                      .watch(getStoresProvider)
                      .when(
                        data: (stores) {
                          return Column(
                            children: stores.map((store) {
                              return StoreTile(
                                logo: store.name?[0] ?? '',
                                title: store.name!,
                                subtitle: store.subTextNote!,
                                slug: store.slug!,
                              );
                            }).toList(),
                          );
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        error: (error, stackTrace) {
                          return Center(child: Text(error.toString()));
                        },
                      ),

                  // StoreTile(
                  //   logo: 'A', // Replace with Image.network or Asset
                  //   title: 'Amazon',
                  //   subtitle: l10n.amazonSubtext,
                  // ),
                  // StoreTile(
                  //   title: 'Walmart',
                  //   subtitle: l10n.electronicsAndMore,
                  //   logo: 'W',
                  // ),
                  // StoreTile(
                  //   title: 'Home Depot',
                  //   subtitle: l10n.homeAndFashion,
                  //   logo: 'H',
                  // ),
                  // StoreTile(
                  //   title: 'Etsy',
                  //   subtitle: l10n.homeAndFashion,
                  //   logo: 'E',
                  // ),
                  // StoreTile(
                  //   title: 'Target',
                  //   subtitle: l10n.homeAndFashion,
                  //   logo: 'T',
                  // ),
                  // StoreTile(
                  //   title: 'Chewy',
                  //   subtitle: l10n.homeAndFashion,
                  //   logo: 'C',
                  // ),
                  const SizedBox(height: 24),

                  // Footer Donation Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4F7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          ref
                              .watch(getAppConfigProvider)
                              .when(
                                data: (appConfig) =>
                                    appConfig.messageHomePage ?? '',
                                loading: () => 'Loading...',
                                error: (error, stackTrace) => error.toString(),
                              ),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2B468F),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.navShare,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.north_east, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
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
