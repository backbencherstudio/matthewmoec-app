import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matthewmoec_app/core/routes/app_route_names.dart';

class StoreTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String logo;
  final String slug;

  const StoreTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.logo,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouteNames.storeDetails, extra: slug);
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
                color: Colors.blue.shade50,
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
                    style: TextStyle(color: Colors.blue.shade700, fontSize: 14),
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
