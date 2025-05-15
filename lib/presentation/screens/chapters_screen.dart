import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../core/constants/appFonts.dart';
import '../controllers/chapters_controller.dart';
import '../widgets/chapter/animatedChapterList.dart';

// Screen displaying the list of chapters for a book with search functionality.
class ChaptersScreen extends StatelessWidget {
  final int bookId;

  const ChaptersScreen({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChaptersController>();
    controller.fetchChapters(bookId); // Fetch chapters when screen is built
    // Reactive search query
    final searchQuery = ''.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chapters',
          style: h2,
        ),
        backgroundColor: AppColors.appColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: TextField(
                onChanged: (value) {
                  searchQuery.value = value; // Update search query reactively
                },
                decoration: InputDecoration(
                  hintText: 'Search chapters by name...',
                  hintStyle: h4.copyWith(color: AppColors.txtColorGray),
                  prefixIcon: Icon(Icons.search, color: AppColors.appColor),
                  filled: true,
                  fillColor: AppColors.backgroundWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            // Chapter list
            Expanded(
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
                // Filter chapters based on search query
                final filteredChapters = controller.chapters
                    .where((chapter) => chapter.title
                        .toLowerCase()
                        .contains(searchQuery.value.toLowerCase()))
                    .toList();
                if (filteredChapters.isEmpty) {
                  return const Center(
                    child: Text(
                      'No chapters found',
                      style: TextStyle(fontSize: 16, color: AppColors.txtColor),
                    ),
                  );
                }
                // Disable animation when search query is not empty
                final bool shouldAnimate = searchQuery.value.isEmpty;
                return AnimatedChapterList(
                  chapters: filteredChapters,
                  controller: controller,
                  animate: shouldAnimate, // Animate only when no search query
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
