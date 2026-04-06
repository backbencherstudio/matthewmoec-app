import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';
import 'package:matthewmoec_app/core/widgets/app_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(subtitle: 'tapAStoreSupportsCharity'.tr()),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shop at these Stores',
                        style: TextStyle(
                          color: Color(0xFF1A3673),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          context.goNamed(AppRouteNames.howItWorks);
                        },
                        icon: const Icon(Icons.info_outline, size: 18),
                        label: const Text("How it works"),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFDDE7F8),
                          shape: StadiumBorder(),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  StoreTile(
                    logo: 'A', // Replace with Image.network or Asset
                    title: 'Amazon',
                    subtitle:
                        'Order online. Pick up in store. Commission still counts.',
                    logoColor: Colors.orange.shade100,
                    isBlueText: true,
                  ),
                  const StoreTile(
                    title: 'Walmart',
                    subtitle: 'Electronics & more',
                    logo: 'W',
                  ),
                  const StoreTile(
                    title: 'Home Depot',
                    subtitle: 'Home & Fashion',
                    logo: 'H',
                  ),
                  const StoreTile(
                    title: 'Etsy',
                    subtitle: 'Home & Fashion',
                    logo: 'E',
                  ),
                  const StoreTile(
                    title: 'Target',
                    subtitle: 'Home & Fashion',
                    logo: 'T',
                  ),
                  const StoreTile(
                    title: 'Chewy',
                    subtitle: 'Home & Fashion',
                    logo: 'C',
                  ),

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
                        const Text(
                          'Last month CartForGood donated \$800 to Feeding America and \$440 to Springfield Food Pantry.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            height: 1.4,
                          ),
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Share',
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

class StoreTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String logo;
  final Color? logoColor;
  final bool isBlueText;

  const StoreTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.logo,
    this.logoColor,
    this.isBlueText = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRouteNames.storeDetails);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Mock Logo
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: logoColor ?? Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                logo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF1A3673),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isBlueText
                          ? Colors.blue.shade700
                          : Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.north_east, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
