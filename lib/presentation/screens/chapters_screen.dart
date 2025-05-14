import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../domain/entities/chapter.dart';
import '../controllers/chapters_controller.dart';

// Screen displaying the list of chapters for a book.
class ChaptersScreen extends StatelessWidget {
  final int bookId;

  const ChaptersScreen({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChaptersController>();
    controller.fetchChapters(bookId); // Fetch chapters when screen is built

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapters'),
        backgroundColor: AppColors.appColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 24,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.appColor),
            );
          }
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.errorMessage.value,
                    style: const TextStyle(
                      color: AppColors.errorColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => controller.fetchChapters(bookId),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          if (controller.chapters.isEmpty) {
            return const Center(
              child: Text(
                'No chapters found',
                style: TextStyle(fontSize: 16, color: AppColors.txtColor),
              ),
            );
          }
          return AnimatedChapterList(
            chapters: controller.chapters,
            controller: controller,
            animate: true, // Enable animation on first load
          );
        }),
      ),
    );
  }
}

// Widget to manage the animated list of chapters.
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
  _AnimatedChapterListState createState() => _AnimatedChapterListState();
}

class _AnimatedChapterListState extends State<AnimatedChapterList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controllers = [];
    _slideAnimations = [];
    for (int i = 0; i < widget.chapters.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300 + (i * 100)),
      );
      final animation = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ));
      _controllers.add(controller);
      _slideAnimations.add(animation);
      if (widget.animate) {
        controller.forward();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.chapters.length,
      itemBuilder: (context, index) {
        final chapter = widget.chapters[index];
        return SlideTransition(
          position: _slideAnimations[index],
          child: ChapterListItem(
            key: ValueKey(chapter.id),
            chapter: chapter,
            controller: widget.controller,
          ),
        );
      },
      separatorBuilder: (context, index) =>
      const Divider(height: 1, color: Colors.grey),
    );
  }
}

// Widget for displaying a single chapter item.
class ChapterListItem extends StatefulWidget {
  final ChapterEntity chapter;
  final ChaptersController controller;

  const ChapterListItem({
    super.key,
    required this.chapter,
    required this.controller,
  });

  @override
  _ChapterListItemState createState() => _ChapterListItemState();
}

class _ChapterListItemState extends State<ChapterListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.98).animate(_tapController);
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _tapController.forward(),
      onTapUp: (_) {
        _tapController.reverse();
        widget.controller.goToHadiths(widget.chapter);
      },
      onTapCancel: () => _tapController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
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
                Icons.bookmark,
                color: AppColors.appColor,
                size: 40,
              ),
              title: Text(
                widget.chapter.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.txtColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.chapter.hadisRange != null)
                    Text(
                      'Book Name: ${widget.chapter.bookName}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.txtColorGray,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  Text(
                    'Hadith Range: ${widget.chapter.hadisRange}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.txtColorGray,
                    ),
                  ),
                  // Add more fields if available in ChapterEntity
                  // Example: if (widget.chapter.chapterNumber != null) ...
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.appColor,
                size: 20,
              ),
              onTap: () => widget.controller.goToHadiths(widget.chapter),
            ),
          ),
        ),
      ),
    );
  }
}