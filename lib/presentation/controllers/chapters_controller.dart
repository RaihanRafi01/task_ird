import 'package:get/get.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/usecases/get_chapters.dart';
import '../screens/hadiths_screen.dart';

// Controller for managing chapters screen state and navigation.
class ChaptersController extends GetxController {
  final GetChapters _getChapters;
  var chapters = <ChapterEntity>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  ChaptersController(this._getChapters);

  // Fetches chapters for a given book and updates the state.
  Future<void> fetchChapters(int bookId) async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _getChapters(bookId);
      chapters.assignAll(result);
    } catch (e) {
      errorMessage('Failed to load chapters: $e');
    } finally {
      isLoading(false);
    }
  }

  // Navigates to the hadiths screen for a selected chapter.
  void goToHadiths(ChapterEntity chapter) {
    print(
        'Navigating to HadithsScreen with chapter_id: ${chapter.chapterId}, book_id: ${chapter.bookId}, book_name: ${chapter.bookName}, number: ${chapter.number}');
    Get.to(
      () => HadithsScreen(
        chapterId: chapter.chapterId,
        bookId: chapter.bookId,
      ),
      transition: Transition.rightToLeft,
      //duration: const Duration(milliseconds: 300),
    );
  }
}