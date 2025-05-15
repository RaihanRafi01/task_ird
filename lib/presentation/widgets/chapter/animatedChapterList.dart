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
    // Create a new Set for tracking animated indices in this session
    final Set<int> animatedIndices = {};

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chapter = chapters[index];
        // Animate only for indices 0–9 if animate is true and not yet animated in this session
        final shouldAnimate = animate && index < 8 && !animatedIndices.contains(index);
        // Use RxDouble for animation state
        final isVisible = (shouldAnimate ? 0.0 : 1.0).obs; // Start hidden if animating
        if (shouldAnimate) {
          Future.delayed(Duration(milliseconds: (index * 100)), () {
            isVisible.value = 1.0; // Trigger animation
            animatedIndices.add(index); // Mark as animated for this session
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