// Entity representing a Book in the domain layer.
class BookEntity {
  final int id;
  final String title;
  final int numberOfHadis;
  final String bookName;

  BookEntity({
    required this.id,
    required this.title,
    required this.numberOfHadis,
    required this.bookName,
  });
}