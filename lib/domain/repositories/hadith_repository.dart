import '../entities/book.dart';
import '../entities/chapter.dart';
import '../entities/hadith.dart';
import '../entities/section.dart';

// Interface defining repository methods for hadith data access.
abstract class HadithRepository {
  Future<List<BookEntity>> getBooks();
  Future<List<ChapterEntity>> getChapters(int bookId);
  Future<List<HadithEntity>> getHadiths(int chapterId, int bookId);
  Future<List<HadithEntity>> getAllHadiths();
  Future<ChapterEntity?> getChapterByChapterId(int chapterId, int bookId);
  Future<List<SectionEntity>> getSections(int chapterId, int bookId);
}