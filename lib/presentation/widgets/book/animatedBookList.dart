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
    // Create a new Set for tracking animated indices in this session
    final Set<int> animatedIndices = {};

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        // Animate only for indices 0–9 if animate is true and not yet animated
        final shouldAnimate = animate && index < 10 && !animatedIndices.contains(index);
        // Use RxDouble for animation state
        final isVisible = (shouldAnimate ? 0.0 : 1.0).obs; // Start hidden if animating
        if (shouldAnimate) {
          Future.delayed(Duration(milliseconds: (index * 100)), () {
            isVisible.value = 1.0; // Trigger animation
            animatedIndices.add(index); // Mark as animated for this session
          });
        }

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