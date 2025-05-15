import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appFonts.dart';
import '../../../domain/entities/chapter.dart';
import '../../controllers/chapters_controller.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterEntity chapter;
  final ChaptersController controller;

  const ChapterListItem({
    super.key,
    required this.chapter,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Reactive scale for tap animation
    final scale = 1.0.obs;

    return GestureDetector(
      onTapDown: (_) => scale.value = 0.98,
      onTapUp: (_) {
        scale.value = 1.0;
        controller.goToHadiths(chapter);
      },
      onTapCancel: () => scale.value = 1.0,
      child: Obx(() => AnimatedScale(
            scale: scale.value,
            duration: const Duration(milliseconds: 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Icon(
                    Icons.menu_book,
                    color: AppColors.appColor,
                    size: 40,
                  ),
                  title: Text(
                    chapter.title,
                    style: h2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.txtColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (chapter.hadisRange != null)
                        Text(
                          'Book Name: ${chapter.bookName}',
                          style: h3.copyWith(
                            fontSize: 14,
                            color: AppColors.txtColorGray,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Hadith Range: ${chapter.hadisRange}',
                        style: h4.copyWith(
                          fontSize: 12,
                          color: AppColors.txtColorGray,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.appColor,
                    size: 20,
                  ),
                  onTap: () => controller.goToHadiths(chapter),
                ),
              ),
            ),
          )),
    );
  }
}
