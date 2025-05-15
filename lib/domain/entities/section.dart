class SectionEntity {
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String title;
  final String? preface;
  final String? number;
  final int? sortOrder;

  SectionEntity({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
    this.preface,
    this.number,
    this.sortOrder,
  });
}