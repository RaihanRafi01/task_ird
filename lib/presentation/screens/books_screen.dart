import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/books_controller.dart';

// Screen displaying the list of books.
class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BooksController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.books.isEmpty) {
          return const Center(child: Text('No books found'));
        }
        return ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text('Hadiths: ${book.abvrCode}'),
              onTap: () => controller.goToChapters(book),
            );
          },
        );
      }),
    );
  }
}