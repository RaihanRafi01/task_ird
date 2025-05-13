import '../entities/book.dart';
import '../repositories/hadith_repository.dart';

// Use case for fetching all books.
class GetBooks {
  final HadithRepository _repository;

  GetBooks(this._repository);

  Future<List<BookEntity>> call() async {
    return await _repository.getBooks();
  }
}