import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/book.dart';
import '../../controllers/books_controller.dart';
import 'bookListItem.dart';

class AnimatedBookList extends StatelessWidget {
  final List<BookEntity> books;
  final BooksController controller;
  final bool animate;

  const AnimatedBookList({
    super.key,
    required this.books,
    required this.controller,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        // Use RxBool for animation state
        final isVisible = (animate ? index * 0.1 : 0.0).obs; // Delay for each item
        Future.delayed(Duration(milliseconds: (index * 100)), () {
          isVisible.value = 1.0; // Trigger animation
        });

        return Obx(() => AnimatedSlide(
          offset: Offset(1.0 - isVisible.value, 0.0),
          duration: Duration(milliseconds: 300 + (index * 100)),
          curve: Curves.easeOut,
          child: BookListItem(
            key: ValueKey(book.id), // Unique key based on book ID
            book: book,
            controller: controller,
          ),
        ));
      },
      separatorBuilder: (context, index) =>
      const Divider(height: 1, color: Colors.grey),
    );
  }
}