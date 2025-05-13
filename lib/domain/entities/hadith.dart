// Entity representing a Hadith in the domain layer.
class HadithEntity {
  final int id;
  final int bookId;
  final int chapterId;
  final String? bn;
  final String? narrator;

  HadithEntity({
    required this.id,
    required this.bookId,
    required this.chapterId,
    this.bn,
    this.narrator,
  });
}