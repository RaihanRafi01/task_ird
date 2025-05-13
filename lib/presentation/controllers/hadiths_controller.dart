import 'package:get/get.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/entities/hadith.dart';
import '../../domain/usecases/get_hadiths.dart';

// Controller for managing hadiths screen state.
class HadithsController extends GetxController {
  final GetHadiths _getHadiths;
  var hadiths = <HadithEntity>[].obs;
  var chapter = Rxn<ChapterEntity>();
  var allHadiths = <HadithEntity>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  HadithsController(this._getHadiths);

  // Fetches hadiths, chapter details, and all hadiths for the screen.
  Future<void> fetchHadiths(int chapterId, int bookId) async {
    try {
      isLoading(true);
      errorMessage('');
      final hadithResult = await _getHadiths(chapterId, bookId);
      final chapterResult = await _getHadiths.getChapterByChapterId(chapterId, bookId);
      final allHadithsResult = await _getHadiths.getAllHadiths();
      hadiths.assignAll(hadithResult);
      chapter.value = chapterResult;
      allHadiths.assignAll(allHadithsResult);
      print('HadithsScreen: chapter_id=$chapterId, book_id=$bookId, hadiths_count=${hadiths.length}, total_hadiths=${allHadiths.length}, chapter_exists=${chapter.value != null}');
      if (hadiths.isNotEmpty) {
        print('Sample hadith: id=${hadiths.first.id}, bn=${hadiths.first.bn}, narrator=${hadiths.first.narrator}');
      }
    } catch (e) {
      errorMessage('Failed to load hadiths: $e');
    } finally {
      isLoading(false);
    }
  }
}