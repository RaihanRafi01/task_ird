import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../core/constants/appFonts.dart';
import '../controllers/chapters_controller.dart';
import '../widgets/chapter/animatedChapterList.dart';

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
