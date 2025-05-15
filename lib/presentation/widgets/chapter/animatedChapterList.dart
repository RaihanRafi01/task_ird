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
  final Set<int> _animatedIndices = {};

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Initialize animations for the first 8 items if animate is true
    _animations = List.generate(
      widget.chapters.length,
          (index) => widget.animate && index < 8
          ? Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.1, // Staggered start
            (index * 0.1) + 0.5, // Duration for each item
            curve: Curves.easeOut,
          ),
        ),
      )
          : const AlwaysStoppedAnimation(1.0), // No animation for others
    );

    if (widget.animate) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedChapterList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset animations if chapters or animate flag changes
    if (oldWidget.chapters != widget.chapters || oldWidget.animate != widget.animate) {
      _animationController.reset();
      _animatedIndices.clear();
      _animations = List.generate(
        widget.chapters.length,
            (index) => widget.animate && index < 8 && !_animatedIndices.contains(index)
            ? Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              index * 0.1,
              (index * 0.1) + 0.5,
              curve: Curves.easeOut,
            ),
          ),
        )
            : const AlwaysStoppedAnimation(1.0),
      );
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