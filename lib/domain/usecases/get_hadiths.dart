import '../entities/chapter.dart';
import '../entities/hadith.dart';
import '../repositories/hadith_repository.dart';

// Use case for fetching hadiths for a chapter and book.
class GetHadiths {
  final HadithRepository _repository;

  GetHadiths(this._repository);

  Future<List<HadithEntity>> call(int chapterId, int bookId) async {
    return await _repository.getHadiths(chapterId, bookId);
  }

  Future<List<HadithEntity>> getAllHadiths() async {
    return await _repository.getAllHadiths();
  }

  Future<ChapterEntity?> getChapterByChapterId(int chapterId, int bookId) async {
    return await _repository.getChapterByChapterId(chapterId, bookId);
  }
}