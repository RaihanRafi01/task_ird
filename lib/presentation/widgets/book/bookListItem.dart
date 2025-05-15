import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appFonts.dart';
import '../../../domain/entities/book.dart';
import '../../controllers/books_controller.dart';

class BookListItem extends StatelessWidget {
  final BookEntity book;
  final BooksController controller;

  const BookListItem({super.key, required this.book, required this.controller});

  @override
  Widget build(BuildContext context) {
    final scale = 1.0.obs;

    return GestureDetector(
      onTapDown: (_) => scale.value = 0.98,
      onTapUp: (_) {
        scale.value = 1.0;
        controller.goToChapters(book);
      },
      onTapCancel: () => scale.value = 1.0,
      child: Obx(() => AnimatedScale(
            scale: scale.value,
            duration: const Duration(milliseconds: 100),
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
                    color: _parseColor(book.colorCode),
                    size: 40,
                  ),
                  title: Text(
                    book.title,
                    style: h2.copyWith(
                      fontSize: 16,
                      color: AppColors.txtColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.titleAr,
                        style: h3.copyWith(
                          fontSize: 14,
                          color: AppColors.txtColorGray,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Hadiths count: ${book.numberOfHadis}',
                        style: h4.copyWith(
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
                              book.title,
                              style: h2.copyWith(
                                fontSize: 18,
                                color: AppColors.appColor,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Text(
                                _parseDescription(book.bookDescr),
                                style: h3.copyWith(
                                  fontSize: 14,
                                  color: AppColors.txtColor,
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Close',
                                  style: h3.copyWith(color: AppColors.appColor),
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
                                style: h4.copyWith(
                                  fontSize: 14,
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
                  onTap: () => controller.goToChapters(book),
                ),
              ),
            ),
          )),
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
    result = result.replaceAll(RegExp(r'\*\*(.*?)\*\*'), '');
    return result;
  }
}
