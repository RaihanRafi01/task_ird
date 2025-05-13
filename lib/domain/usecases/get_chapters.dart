import '../entities/chapter.dart';
import '../repositories/hadith_repository.dart';

// Use case for fetching chapters for a book.
class GetChapters {
  final HadithRepository _repository;

  GetChapters(this._repository);

  Future<List<ChapterEntity>> call(int bookId) async {
    return await _repository.getChapters(bookId);
  }
}