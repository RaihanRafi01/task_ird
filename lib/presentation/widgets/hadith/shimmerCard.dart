import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/appColors.dart';

class ShimmerHadithCard extends StatelessWidget {
  final bool showHeader;

  const ShimmerHadithCard({super.key, this.showHeader = false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              if (showHeader) _buildShimmerChapterHeader(),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.all(12),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerHadithHeader(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3),
                          _buildShimmerText(height: 20, lines: 2), // Arabic text
                          const SizedBox(height: 20),
                          _buildShimmerText(height: 14, width: 150), // Narrator
                          const SizedBox(height: 20),
                          _buildShimmerText(height: 14, lines: 3), // Translation
                          const SizedBox(height: 20),
                          _buildShimmerText(height: 12, width: 200), // References
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerChapterHeader() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 12,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerHadithHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              Container(
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 13,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Container(
                  width: 80,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerText({
    required double height,
    double? width,
    int lines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        lines,
            (index) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Container(
            width: width ?? double.infinity,
            height: height,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}