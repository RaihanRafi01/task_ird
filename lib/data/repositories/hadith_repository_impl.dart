import 'package:task_ird/domain/entities/section.dart';

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
    return books
        .map((book) => BookEntity(
              id: book.id,
              title: book.title,
              numberOfHadis: book.number_of_hadis,
              bookName: book.book_name,
              titleAr: book.title_ar,
              abvrCode: book.abvr_code,
              bookDescr: book.book_descr,
              colorCode: book.color_code,
            ))
        .toList();
  }

  @override
  Future<List<ChapterEntity>> getChapters(int bookId) async {
    // Fetch chapters for a book and map to domain entities.
    final chapters = await _database.getChapters(bookId);
    return chapters
        .map((chapter) => ChapterEntity(
            chapterId: chapter.chapter_id,
            bookId: chapter.book_id,
            title: chapter.title,
            number: chapter.number,
            bookName: chapter.book_name,
            id: chapter.id,
            hadisRange: chapter.hadis_range))
        .toList();
  }

  @override
  Future<List<HadithEntity>> getHadiths(int chapterId, int bookId) async {
    try {
      // Fetch hadiths for a chapter and book
      final hadiths = await _database.getHadiths(chapterId, bookId);
      final validHadiths = <HadithEntity>[];

      // Map database results to domain entities, skipping invalid records
      for (var hadith in hadiths) {
        try {
          validHadiths.add(HadithEntity(
              id: hadith.id,
              bookId: hadith.book_id,
              chapterId: hadith.chapter_id,
              bn: hadith.bn,
              narrator: hadith.narrator,
              bookName: hadith.book_name ?? 'Unknown',
              // Fallback for null
              hadithKey: hadith.hadith_key ?? 'Unknown',
              // Fallback for null
              hadithId: hadith.hadith_id ?? 0,
              // Fallback for null
              ar: hadith.ar,
              grade: hadith.grade,
              gradeColor: hadith.grade_color,
              note: hadith.note,
              sectionId: hadith.section_id));
        } catch (e) {
          print(
              'Skipping invalid hadith record (id=${hadith.id}, chapter_id=$chapterId, book_id=$bookId): $e');
        }
      }

      print(
          'getHadiths: chapter_id=$chapterId, book_id=$bookId, result_count=${validHadiths.length}');
      return validHadiths;
    } catch (e) {
      print('Error in getHadiths: $e\nStack trace: ${StackTrace.current}');
      return []; // Return empty list on failure
    }
  }

  @override
  Future<List<HadithEntity>> getAllHadiths() async {
    try {
      final hadiths = await _database.getAllHadiths();
      final validHadiths = <HadithEntity>[];
      for (var hadith in hadiths) {
        try {
          validHadiths.add(HadithEntity(
              id: hadith.id,
              bookId: hadith.book_id,
              chapterId: hadith.chapter_id,
              bn: hadith.bn,
              narrator: hadith.narrator,
              bookName: hadith.book_name ?? 'Unknown',
              // Fallback for null
              hadithKey: hadith.hadith_key ?? 'Unknown',
              // Fallback for null
              hadithId: hadith.hadith_id ?? 0,
              // Fallback for null
              ar: hadith.ar,
              grade: hadith.grade,
              gradeColor: hadith.grade_color,
              note: hadith.note,
              sectionId: hadith.section_id));
        } catch (e) {
          print('Skipping invalid hadith record (id=${hadith.id}): $e');
        }
      }
      return validHadiths;
    } catch (e) {
      print('Error in getAllHadiths: $e\nStack trace: ${StackTrace.current}');
      return [];
    }
  }

  @override
  Future<ChapterEntity?> getChapterByChapterId(
      int chapterId, int bookId) async {
    // Fetch chapter details and map to domain entity.
    final chapter = await _database.getChapterByChapterId(chapterId, bookId);
    if (chapter == null) return null;
    return ChapterEntity(
      chapterId: chapter.chapter_id,
      bookId: chapter.book_id,
      title: chapter.title,
      number: chapter.number,
      bookName: chapter.book_name,
      id: chapter.id,
    );
  }

  @override
  Future<List<SectionEntity>> getSections(int chapterId, int bookId) async {
    // Fetch sections for a chapter and book, map to domain entities with all fields.
    final sections = await _database.getSections(chapterId, bookId);
    return sections
        .map((section) => SectionEntity(
              id: section.id,
              bookId: section.book_id,
              bookName: section.book_name,
              chapterId: section.chapter_id,
              sectionId: section.section_id,
              title: section.title,
              preface: section.preface,
              number: section.number,
              sortOrder: section.sort_order,
            ))
        .toList();
  }
}
