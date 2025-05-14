// Entity representing a Chapter in the domain layer, including all fields from the Chapter table.
class ChapterEntity {
  final int id;
  final int chapterId;
  final int bookId;
  final String title;
  final int number;
  final String? hadisRange;
  final String bookName;

  ChapterEntity({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.number,
    this.hadisRange,
    required this.bookName,
  });
}