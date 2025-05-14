import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(title: const Text('Chapters')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.chapters.isEmpty) {
          return const Center(child: Text('No chapters found'));
        }
        return ListView.builder(
          itemCount: controller.chapters.length,
          itemBuilder: (context, index) {
            final chapter = controller.chapters[index];
            return ListTile(
              title: Text(chapter.title),
              subtitle: Text(chapter.hadisRange ?? 'No range specified'),
              onTap: () => controller.goToHadiths(chapter),
            );
          },
        );
      }),
    );
  }
}