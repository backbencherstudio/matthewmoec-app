import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharityCardShimmer extends StatelessWidget {
  final int itemCount;

  const CharityCardShimmer({
    super.key,
    this.itemCount = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => Container(
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
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFE0E5EC),
            highlightColor: const Color(0xFFF5F7FA),
            child: Column(
              children: [
                // Line 1: Title (e.g. "Last month shared")
                Container(
                  height: 18,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 16),
                // Line 2: Big Amount ($232323)
                Container(
                  height: 48,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 16),
                // Line 3: Date | Org Name
                Container(
                  height: 16,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
