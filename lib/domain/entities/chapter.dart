// Entity representing a Chapter in the domain layer.
class ChapterEntity {
  final int chapterId;
  final int bookId;
  final String title;
  final int number;
  final String bookName;

  ChapterEntity({
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.number,
    required this.bookName,
  });
}