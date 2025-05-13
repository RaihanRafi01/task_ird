import 'package:get/get.dart';
import '../../domain/entities/book.dart';
import '../../domain/usecases/get_books.dart';
import '../screens/chapters_screen.dart';

// Controller for managing books screen state and navigation.
class BooksController extends GetxController {
  final GetBooks _getBooks;
  var books = <BookEntity>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  BooksController(this._getBooks);

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  // Fetches all books and updates the state.
  Future<void> fetchBooks() async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _getBooks();
      books.assignAll(result);
    } catch (e) {
      errorMessage('Failed to load books: $e');
    } finally {
      isLoading(false);
    }
  }

  // Navigates to the chapters screen for a selected book.
  void goToChapters(BookEntity book) {
    Get.to(() => ChaptersScreen(bookId: book.id));
  }
}