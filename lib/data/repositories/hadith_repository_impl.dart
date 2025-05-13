import '../../domain/entities/book.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/entities/hadith.dart';
import '../../domain/repositories/hadith_repository.dart';
import '../datasources/database.dart';

// Implementation of the HadithRepository interface.
class HadithRepositoryImpl implements HadithRepository {
  final MyDatabase _database;

  HadithRepositoryImpl(this._database);

  @override
  Future<List<BookEntity>> getBooks() async {
    // Fetch books from the database and map to domain entities.
    final books = await _database.getBooks();
    return books.map((book) => BookEntity(
      id: book.id,
      title: book.title,
      numberOfHadis: book.number_of_hadis,
      bookName: book.book_name,
    )).toList();
  }

  @override
  Future<List<ChapterEntity>> getChapters(int bookId) async {
    // Fetch chapters for a book and map to domain entities.
    final chapters = await _database.getChapters(bookId);
    return chapters.map((chapter) => ChapterEntity(
      chapterId: chapter.chapter_id,
      bookId: chapter.book_id,
      title: chapter.title,
      number: chapter.number,
      bookName: chapter.book_name,
    )).toList();
  }

  @override
  Future<List<HadithEntity>> getHadiths(int chapterId, int bookId) async {
    // Fetch hadiths for a chapter and book, map to domain entities.
    final hadiths = await _database.getHadiths(chapterId, bookId);
    return hadiths.map((hadith) => HadithEntity(
      id: hadith.id,
      bookId: hadith.book_id,
      chapterId: hadith.chapter_id,
      bn: hadith.bn,
      narrator: hadith.narrator,
    )).toList();
  }

  @override
  Future<List<HadithEntity>> getAllHadiths() async {
    // Fetch all hadiths and map to domain entities.
    final hadiths = await _database.getAllHadiths();
    return hadiths.map((hadith) => HadithEntity(
      id: hadith.id,
      bookId: hadith.book_id,
      chapterId: hadith.chapter_id,
      bn: hadith.bn,
      narrator: hadith.narrator,
    )).toList();
  }

  @override
  Future<ChapterEntity?> getChapterByChapterId(int chapterId, int bookId) async {
    // Fetch chapter details and map to domain entity.
    final chapter = await _database.getChapterByChapterId(chapterId, bookId);
    if (chapter == null) return null;
    return ChapterEntity(
      chapterId: chapter.chapter_id,
      bookId: chapter.book_id,
      title: chapter.title,
      number: chapter.number,
      bookName: chapter.book_name,
    );
  }
}