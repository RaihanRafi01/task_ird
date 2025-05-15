import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/chapter.dart';
import '../../controllers/chapters_controller.dart';
import 'chapterListItem.dart';

class AnimatedChapterList extends StatelessWidget {
  final List<ChapterEntity> chapters;
  final ChaptersController controller;
  final bool animate;

  const AnimatedChapterList({
    super.key,
    required this.chapters,
    required this.controller,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chapter = chapters[index];
        // Use RxDouble for animation state
        final isVisible = (animate ? 0.0 : 1.0).obs; // Start hidden if animating
        if (animate) {
          Future.delayed(Duration(milliseconds: (index * 100)), () {
            isVisible.value = 1.0; // Trigger animation
          });
        }

        return Obx(() => AnimatedSlide(
          offset: Offset(1.0 - isVisible.value, 0.0),
          duration: Duration(milliseconds: 300 + (index * 100)),
          curve: Curves.easeOut,
          child: ChapterListItem(
            key: ValueKey(chapter.id),
            chapter: chapter,
            controller: controller,
          ),
        ));
      },
      separatorBuilder: (context, index) =>
      const Divider(height: 1, color: Colors.grey),
    );
  }
}