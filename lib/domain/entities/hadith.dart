// Entity representing a Hadith in the domain layer, including all fields from the Hadith table.
class HadithEntity {
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int? sectionId;
  final String hadithKey;
  final int hadithId;
  final String? narrator;
  final String? bn;
  final String? ar;
  final String? arDiacless;
  final String? note;
  final int? gradeId;
  final String? grade;
  final String? gradeColor;

  HadithEntity({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    this.sectionId,
    required this.hadithKey,
    required this.hadithId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
  });
}