import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../core/constants/constants.dart';
import '../models/hadith_models.dart';

part 'database.g.dart';

// Database class for managing Drift database operations.
@DriftDatabase(tables: [Books, Chapter, Hadith, Section])
class MyDatabase extends _$MyDatabase {
  // Singleton instance for database access.
  static final MyDatabase _instance = MyDatabase._internal();

  factory MyDatabase() => _instance;

  MyDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Fetches all books from the database.
  Future<List<Book>> getBooks() async {
    try {
      final result = await select(books).get();
      print('getBooks: result_count=${result.length}');
      return result;
    } catch (e, stack) {
      print('Error in getBooks: $e');
      print('Stack trace: $stack');
      return [];
    }
  }

  // Fetches chapters for a specific book.
  Future<List<ChapterData>> getChapters(int bookId) async {
    try {
      final result = await (select(chapter)..where((c) => c.book_id.equals(bookId))).get();
      print('getChapters: book_id=$bookId, result_count=${result.length}');
      return result;
    } catch (e, stack) {
      print('Error in getChapters: $e');
      print('Stack trace: $stack');
      return [];
    }
  }

  // Fetches hadiths for a specific chapter and book.
  Future<List<HadithData>> getHadiths(int chapterId, int bookId) async {
    try {
      final result = await (select(hadith)
        ..where((h) => h.chapter_id.equals(chapterId) & h.book_id.equals(bookId)))
          .get();
      print('getHadiths: chapter_id=$chapterId, book_id=$bookId, result_count=${result.length}');
      if (result.isNotEmpty) {
        print('Sample hadith: id=${result.first.id}, bn=${result.first.bn}, narrator=${result.first.narrator}');
      }
      return result;
    } catch (e, stack) {
      print('Error in getHadiths: $e');
      print('Stack trace: $stack');
      return [];
    }
  }

  // Fetches all hadiths (for debugging).
  Future<List<HadithData>> getAllHadiths() async {
    try {
      final result = await select(hadith).get();
      print('getAllHadiths: total_count=${result.length}');
      return result;
    } catch (e, stack) {
      print('Error in getAllHadiths: $e');
      print('Stack trace: $stack');
      return [];
    }
  }

  // Fetches chapter details for a specific chapter and book.
  Future<ChapterData?> getChapterByChapterId(int chapterId, int bookId) async {
    try {
      final results = await (select(chapter)
        ..where((c) => c.chapter_id.equals(chapterId) & c.book_id.equals(bookId)))
          .get();
      print('getChapterByChapterId: chapter_id=$chapterId, book_id=$bookId, results_count=${results.length}');
      if (results.isEmpty) return null;
      if (results.length > 1) {
        print('Warning: Multiple chapters found for chapter_id=$chapterId, book_id=$bookId');
      }
      return results.first;
    } catch (e, stack) {
      print('Error in getChapterByChapterId: $e');
      print('Stack trace: $stack');
      return null;
    }
  }
}

// Opens a connection to the Drift database.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstants.databasePath));
    return NativeDatabase(file);
  });
}