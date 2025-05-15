import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appFonts.dart';
import '../../../core/constants/constants.dart';

class HadithMoreOptionsSheet extends StatelessWidget {
  final int hadithId;
  final Function()? onClose;

  const HadithMoreOptionsSheet({
    required this.hadithId,
    this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          _buildOptionsList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'More Option',
            style: h2.copyWith(
              fontSize: 15,
              color: AppColors.bottomSheetTitle,
            ),
          ),
          GestureDetector(
            onTap: onClose ?? () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.close,
              size: 22,
              color: AppColors.bottomSheetIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildOptionItem(
          svgPath: AppConstants.hadithGoToIconPath,
          label: 'Go To Main Hadith',
          onTap: () {
            Navigator.of(context).pop();
            // Navigate to main hadith
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithCollectionIconPath,
          label: 'Add to Collection',
          onTap: () {
            Navigator.of(context).pop();
            // Add to collection functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithCopyIconPath,
          label: 'Bangla Copy',
          onTap: () {
            Navigator.of(context).pop();
            // Copy Bangla text functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithCopyIconPath,
          label: 'English Copy',
          onTap: () {
            Navigator.of(context).pop();
            // Copy English text functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithCopyIconPath,
          label: 'Arabic Copy',
          onTap: () {
            Navigator.of(context).pop();
            // Copy Arabic text functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithAddIconPath,
          label: 'Add Hifz',
          onTap: () {
            Navigator.of(context).pop();
            // Add Hifz functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithAddIconPath,
          label: 'Add Note',
          onTap: () {
            Navigator.of(context).pop();
            // Add note functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithShareIconPath,
          label: 'Share',
          onTap: () {
            Navigator.of(context).pop();
            // Share functionality
          },
        ),
        _buildOptionItem(
          svgPath: AppConstants.hadithReportIconPath,
          label: 'Report',
          onTap: () {
            Navigator.of(context).pop();
            // Report functionality
          },
        ),
      ],
    );
  }

  Widget _buildOptionItem({
    required String svgPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: h3.copyWith(
                fontSize: 14,
                color: AppColors.titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to show the bottom sheet
void showHadithMoreOptions(BuildContext context, int hadithId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => HadithMoreOptionsSheet(hadithId: hadithId),
  );
}
