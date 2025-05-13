import 'package:get/get.dart';
import '../../data/datasources/database.dart';
import '../../data/repositories/hadith_repository_impl.dart';
import '../../domain/repositories/hadith_repository.dart';
import '../../domain/usecases/get_books.dart';
import '../../domain/usecases/get_chapters.dart';
import '../../domain/usecases/get_hadiths.dart';
import '../../presentation/controllers/books_controller.dart';
import '../../presentation/controllers/chapters_controller.dart';
import '../../presentation/controllers/hadiths_controller.dart';

// Sets up dependency injection using GetX for the app's dependencies.
void setupDependencies() {
  // Data layer
  Get.put<MyDatabase>(MyDatabase());

  // Repository
  Get.put<HadithRepository>(HadithRepositoryImpl(Get.find<MyDatabase>()));

  // Use cases
  Get.put(GetBooks(Get.find<HadithRepository>()));
  Get.put(GetChapters(Get.find<HadithRepository>()));
  Get.put(GetHadiths(Get.find<HadithRepository>()));

  // Controllers
  Get.put(BooksController(Get.find<GetBooks>()));
  Get.put(ChaptersController(Get.find<GetChapters>()));
  Get.put(HadithsController(Get.find<GetHadiths>()));
}