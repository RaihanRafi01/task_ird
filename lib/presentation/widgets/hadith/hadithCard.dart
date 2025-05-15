import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_ird/core/constants/constants.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appFonts.dart';
import '../../../domain/entities/hadith.dart';
import '../../../domain/entities/section.dart';
import '../../controllers/hadiths_controller.dart';
import 'hadithBottomSheet.dart';

class HadithCard extends StatelessWidget {
  final HadithEntity hadith;
  final int index;
  final HadithsController controller;

  const HadithCard({
    required this.hadith,
    required this.index,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Find the section matching the hadith's sectionId
    SectionEntity? matchingSection;
    if (hadith.sectionId != null) {
      matchingSection = controller.sections.firstWhereOrNull(
            (section) => section.sectionId == hadith.sectionId,
      );
    }

    // Show header if this is the first hadith of a section
    bool showHeader = false;
    if (matchingSection != null) {
      // Check if this is the first hadith or the sectionId differs from the previous hadith
      if (index == 0 ||
          controller.hadiths[index - 1].sectionId != hadith.sectionId) {
        showHeader = true;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            if (showHeader && matchingSection != null)
              _buildChapterHeader(matchingSection),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(12),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHadithHeader(context),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        if (hadith.ar != null && hadith.ar!.isNotEmpty)
                          _buildArabicText(),
                        const SizedBox(height: 20),
                        if (hadith.narrator != null &&
                            hadith.narrator!.isNotEmpty)
                          _buildNarratorText(),
                        const SizedBox(height: 20),
                        if (hadith.bn != null && hadith.bn!.isNotEmpty)
                          _buildTranslationText(),
                        _buildReferences(),
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

  Widget _buildChapterHeader(SectionEntity section) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: section.number?.toString() ?? '',
                  style: h2.copyWith(
                    fontSize: 14,
                    color: AppColors.appColor,
                  ),
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: section.title,
                  style: h2.copyWith(
                    fontSize: 14,
                    color: AppColors.titleColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Divider(
            color: AppColors.dividerColor, // Color for the horizontal line
            thickness: 1, // Adjust thickness as needed
            height: 8, // Space around the divider
          ),
          const SizedBox(height: 12), // Optional: Add spacing after the divider
          Text(
            section.preface ?? 'No preface available',
            style: h4.copyWith(
              fontSize: 12,
              color: AppColors.subTitleColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHadithHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AppConstants.hadithHexagonIconPath),
              Text(
                'B',
                style: h3.copyWith(
                  fontSize: 14,
                  color: Colors.white
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hadith No: ",
                        style: h3.copyWith(
                          fontSize: 13,
                          color: AppColors.titleColor,
                        ),
                      ),
                      TextSpan(
                        text: "${hadith.hadithId}",
                        style: h3.copyWith(
                          fontSize: 13,
                          color: AppColors.appColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  hadith.bookName,
                  style:
                  h4.copyWith(fontSize: 12, color: AppColors.subTitleColor),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(int.parse(
                  hadith.gradeColor?.replaceFirst('#', '0xFF') ??
                      '0xFF009688')),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              hadith.grade ?? 'Sahih',
              style: h3.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
              onTap: (){
                showHadithMoreOptions(context, hadith.id);
              },
              child: const Icon(Icons.more_vert_rounded,
                  color: AppColors.btnColorGray)),
        ],
      ),
    );
  }

  Widget _buildNarratorText() {
    return Text(
      '${hadith.narrator} থেকে বর্ণিত:',
      style: h2.copyWith(fontSize: 14, color: AppColors.appColor),
    );
  }

  Widget _buildArabicText() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        hadith.ar ?? '',
        style: h4.copyWith(
          fontSize: 20,
          height: 1.8,
          fontFamily: 'me_quran',
        ),
      ),
    );
  }

  Widget _buildTranslationText() {
    return Text(
      hadith.bn ?? '',
      style: h4.copyWith(
        fontSize: 14,
        height: 1.5,
      ),
    );
  }

  Widget _buildReferences() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        hadith.note ?? '(No references available)',
        style: h4.copyWith(
          fontSize: 12,
          color: AppColors.subTitleColor,
        ),
      ),
    );
  }
}
