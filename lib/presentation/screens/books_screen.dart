import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appColors.dart';
import '../../domain/entities/book.dart';
import '../controllers/books_controller.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BooksController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
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
                    style: const TextStyle(color: AppColors.errorColor, fontSize: 16),
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
            return const Center(
                child: Text('No books found', style: TextStyle(fontSize: 16)));
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

// Widget to manage the animated list of books.
class AnimatedBookList extends StatefulWidget {
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
  _AnimatedBookListState createState() => _AnimatedBookListState();
}

class _AnimatedBookListState extends State<AnimatedBookList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controllers = [];
    _slideAnimations = [];
    for (int i = 0; i < widget.books.length; i++) {
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
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        final book = widget.books[index];
        return SlideTransition(
          position: _slideAnimations[index],
          child: BookListItem(
            key: ValueKey(book.id), // Unique key based on book ID
            book: book,
            controller: widget.controller,
          ),
        );
      },
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Colors.grey),
    );
  }
}

// Widget for displaying a single book item with description menu.
class BookListItem extends StatefulWidget {
  final BookEntity book;
  final BooksController controller;

  const BookListItem({super.key, required this.book, required this.controller});

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem>
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
        widget.controller.goToChapters(widget.book);
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
                Icons.book,
                color: _parseColor(widget.book.colorCode),
                size: 40,
              ),
              title: Text(
                widget.book.title,
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
                  Text(
                    widget.book.titleAr,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.txtColorGray,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Hadiths count: ${widget.book.numberOfHadis}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.txtColorGray,
                    ),
                  ),
                ],
              ),
              trailing: PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.appColor,
                  size: 20,
                ),
                onSelected: (value) {
                  if (value == 'description') {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          widget.book.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.appColor,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Text(
                            _parseDescription(widget.book.bookDescr),
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.txtColor,
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Close',
                              style: TextStyle(color: AppColors.appColor),
                            ),
                          ),
                        ],
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'description',
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: AppColors.appColor,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'View Description',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.txtColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                elevation: 4,
                offset: const Offset(0, 8),
                splashRadius: 20,
                tooltip: 'More options',
              ),
              onTap: () => widget.controller.goToChapters(widget.book),
            ),
          ),
        ),
      ),
    );
  }

  // Parses the color_code to a Color, with fallback to #1AA483.
  Color _parseColor(String hex) {
    try {
      if (hex.startsWith('#')) {
        return Color(int.parse(hex.replaceFirst('#', '0xFF')));
      }
      return AppColors.appColor;
    } catch (e) {
      return AppColors.appColor;
    }
  }

  // Parses HTML-like description to plain text with basic formatting.
  String _parseDescription(String description) {
    if (description.isEmpty) return 'No description available';
    String result = description
        .replaceAll(RegExp(r'<h2>(.*?)</h2>'), '**\$1**') // Bold for <h2>
        .replaceAll(RegExp(r'<br>'), '\n') // Newline for <br>
        .replaceAll(RegExp(r'<[^>]+>'), ''); // Remove other tags
    // Convert **text** to bold in display (handled by TextStyle in future if needed)
    result = result.replaceAll(RegExp(r'\*\*(.*?)\*\*'), '');
    return result;
  }

}
