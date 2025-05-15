import 'package:flutter/material.dart';

import '../../../domain/entities/chapter.dart';
import '../../controllers/chapters_controller.dart';
import 'chapterListItem.dart';

class AnimatedChapterList extends StatefulWidget {
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
  AnimatedChapterListState createState() => AnimatedChapterListState();
}

class AnimatedChapterListState extends State<AnimatedChapterList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _initializeAnimations();

    if (widget.animate) {
      _animationController.forward();
    }
  }

  void _initializeAnimations() {
    // Initialize animations for the first 8 items if animate is true
    _animations = List.generate(
      widget.chapters.length,
          (index) {
        if (!widget.animate || index >= 8) {
          return const AlwaysStoppedAnimation(1.0);
        }
        // Ensure the interval stays within 0.0 to 1.0
        double begin = index * 0.1;
        double end = (begin + 0.3).clamp(0.0, 1.0); // Reduced duration to 0.3
        return Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              begin,
              end,
              curve: Curves.easeOut,
            ),
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(AnimatedChapterList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset animations if chapters or animate flag changes
    if (oldWidget.chapters != widget.chapters || oldWidget.animate != widget.animate) {
      _animationController.reset();
      _initializeAnimations();
      if (widget.animate) {
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.chapters.length,
      itemBuilder: (context, index) {
        final chapter = widget.chapters[index];
        return FadeTransition(
          opacity: _animations[index],
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(_animations[index]),
            child: ChapterListItem(
              key: ValueKey(chapter.id),
              chapter: chapter,
              controller: widget.controller,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 1, color: Colors.grey),
    );
  }
}