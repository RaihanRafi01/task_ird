import '../entities/hadith.dart';
import '../entities/chapter.dart';
import '../entities/section.dart';
import '../repositories/hadith_repository.dart';

// Use case for fetching hadiths, chapters, and sections.
class GetHadiths {
  final HadithRepository _repository;

  GetHadiths(this._repository);

  // Fetches hadiths for a specific chapter and book.
  Future<List<HadithEntity>> call(int chapterId, int bookId) async {
    return await _repository.getHadiths(chapterId, bookId);
  }

  // Fetches all hadiths for debugging.
  Future<List<HadithEntity>> getAllHadiths() async {
    return await _repository.getAllHadiths();
  }

  // Fetches chapter details for a specific chapter and book.
  Future<ChapterEntity?> getChapterByChapterId(int chapterId, int bookId) async {
    return await _repository.getChapterByChapterId(chapterId, bookId);
  }

  // Fetches sections for a specific chapter and book.
  Future<List<SectionEntity>> getSections(int chapterId, int bookId) async {
    return await _repository.getSections(chapterId, bookId);
  }
}