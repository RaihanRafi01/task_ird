import 'package:get/get.dart';
import '../../domain/entities/book.dart';
import '../../domain/usecases/get_books.dart';
import '../screens/chapters_screen.dart';

// Controller for managing books screen state.
class BooksController extends GetxController {
  final GetBooks _getBooks;
  var books = <BookEntity>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var firstLoad = true.obs; // Flag for first load animation

  BooksController(this._getBooks);

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _getBooks();
      books.assignAll(result);
      if (firstLoad.value) {
        Future.delayed(const Duration(milliseconds: 3000), () {
          firstLoad(false); // Disable animation after first load
        });
      }
    } catch (e) {
      errorMessage('Failed to load books: $e');
    } finally {
      isLoading(false);
    }
  }

  void goToChapters(BookEntity book) {
    Get.to(
      () => ChaptersScreen(bookId: book.id),
      transition: Transition.rightToLeft, // Choose your desired animation
      duration: Duration(milliseconds: 300), // Optional: Set animation duration
    );
  }
}