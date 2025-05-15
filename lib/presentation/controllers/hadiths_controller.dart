import 'package:get/get.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/entities/hadith.dart';
import '../../domain/entities/section.dart'; // Add this import
import '../../domain/usecases/get_hadiths.dart';

// Controller for managing hadiths screen state.
class HadithsController extends GetxController {
  final GetHadiths _getHadiths;
  var hadiths = <HadithEntity>[].obs;
  var chapter = Rxn<ChapterEntity>();
  var allHadiths = <HadithEntity>[].obs;
  var sections = <SectionEntity>[].obs; // Add observable for sections
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  HadithsController(this._getHadiths);

  // Fetches hadiths, chapter details, sections, and all hadiths for the screen.
  Future<void> fetchHadiths(int chapterId, int bookId) async {
    try {
      isLoading(true);
      errorMessage('');

      // Fetch hadiths
      try {
        final hadithResult = await _getHadiths(chapterId, bookId);
        hadiths.assignAll(hadithResult);
      } catch (e) {
        print('Error in getHadiths: $e\nStack trace: ${StackTrace.current}');
        errorMessage('Failed to load hadiths: $e');
      }

      // Fetch chapter
      try {
        final chapterResult =
            await _getHadiths.getChapterByChapterId(chapterId, bookId);
        chapter.value = chapterResult;
        print(
            'getChapterByChapterId: chapter_id=$chapterId, book_id=$bookId, results_count=${chapterResult != null ? 1 : 0}');
      } catch (e) {
        print(
            'Error in getChapterByChapterId: $e\nStack trace: ${StackTrace.current}');
        errorMessage('Failed to load chapter: $e');
      }

      // Fetch sections
      try {
        final sectionResult = await _getHadiths.getSections(chapterId, bookId);
        sections.assignAll(sectionResult);
      } catch (e) {
        print('Error in getSections: $e\nStack trace: ${StackTrace.current}');
        errorMessage('Failed to load sections: $e');
      }

      // Fetch all hadiths
      try {
        final allHadithsResult = await _getHadiths.getAllHadiths();
        allHadiths.assignAll(allHadithsResult);
      } catch (e) {
        print('Error in getAllHadiths: $e\nStack trace: ${StackTrace.current}');
        errorMessage('Failed to load all hadiths: $e');
      }

      print(
          'HadithsScreen: chapter_id=$chapterId, book_id=$bookId, hadiths_count=${hadiths.length}, sections_count=${sections.length}, total_hadiths=${allHadiths.length}, chapter_exists=${chapter.value != null}');
      if (hadiths.isNotEmpty) {
        print(
            'Sample hadith: id=${hadiths.first.id}, bn=${hadiths.first.bn}, ar=${hadiths.first.ar}, narrator=${hadiths.first.narrator}, grade=${hadiths.first.grade}');
      }
      if (sections.isNotEmpty) {
        print(
            'Sample section: id=${sections.first.id}, title=${sections.first.title}, preface=${sections.first.preface}');
      }
    } catch (e) {
      errorMessage('Unexpected error: $e');
    } finally {
      isLoading(false);
    }
  }
}
