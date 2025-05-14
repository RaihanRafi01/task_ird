import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/hadiths_controller.dart';

// Screen displaying hadiths for a specific chapter and book.
class HadithsScreen extends StatelessWidget {
  final int chapterId;
  final int bookId;

  const HadithsScreen({required this.chapterId, required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HadithsController>();
    controller.fetchHadiths(chapterId, bookId); // Fetch hadiths when screen is built

    return Scaffold(
      appBar: AppBar(title: const Text('Hadiths')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Book ID: $bookId'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Chapter ID: $chapterId'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.chapter.value != null
                  ? Text('Chapter: ${controller.chapter.value!.title} (Number: ${controller.chapter.value!.number})')
                  : const Text('Chapter not found'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total hadiths in database: ${controller.allHadiths.length}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hadiths for chapter_id $chapterId, book_id $bookId: ${controller.hadiths.length}'),
            ),
            controller.hadiths.isEmpty
                ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('No hadiths found'),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: controller.hadiths.length,
                itemBuilder: (context, index) {
                  final hadith = controller.hadiths[index];
                  return ListTile(
                    title: Text(hadith.bn?.isNotEmpty == true ? hadith.bn! : 'No text available'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hadith.narrator?.isNotEmpty == true ? 'Narrated by: ${hadith.narrator}' : 'Narrator unknown'),
                        Text(hadith.ar?.isNotEmpty == true ? 'Arabic: ${hadith.ar}' : 'No Arabic text'),
                        Text(hadith.grade?.isNotEmpty == true ? 'Grade: ${hadith.grade}' : 'No grade'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}