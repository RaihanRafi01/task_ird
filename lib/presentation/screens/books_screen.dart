import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../core/constants/appFonts.dart';
import '../controllers/books_controller.dart';
import '../widgets/book/animatedBookList.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BooksController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Books',
          style: h2,
        ),
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.appColor));
          }
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.errorMessage.value,
                    style: const TextStyle(
                        color: AppColors.errorColor, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: controller.fetchBooks,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColor),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          if (controller.books.isEmpty) {
            return Center(
                child:
                    Text('No books found', style: h3.copyWith(fontSize: 16)));
          }
          return AnimatedBookList(
            books: controller.books,
            controller: controller,
            animate: controller.firstLoad.value,
          );
        }),
      ),
    );
  }
}
