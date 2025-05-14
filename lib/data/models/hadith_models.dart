import 'package:drift/drift.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get title_ar => text()();
  IntColumn get number_of_hadis => integer()();
  TextColumn get abvr_code => text()();
  TextColumn get book_name => text()();
  TextColumn get book_descr => text()();
  TextColumn get color_code => text()();
}

class Chapter extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapter_id => integer()();
  IntColumn get book_id => integer()();
  TextColumn get title => text()();
  IntColumn get number => integer()();
  TextColumn get hadis_range => text().nullable()();
  TextColumn get book_name => text()();
}

class Hadith extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book_id => integer()();
  TextColumn get book_name => text().nullable()();
  IntColumn get chapter_id => integer()();
  IntColumn get section_id => integer().nullable()();
  TextColumn get hadith_key => text().nullable()();
  IntColumn get hadith_id => integer().nullable()();
  TextColumn get narrator => text().nullable()();
  TextColumn get bn => text().nullable()();
  TextColumn get ar => text().nullable()();
  TextColumn get ar_diacless => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get grade_id => integer().nullable()();
  TextColumn get grade => text().nullable()();
  TextColumn get grade_color => text().nullable()();
}

class Section extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book_id => integer()();
  TextColumn get book_name => text()();
  IntColumn get chapter_id => integer()();
  IntColumn get section_id => integer()();
  TextColumn get title => text()();
  TextColumn get preface => text().nullable()();
  TextColumn get number => text().nullable()(); // Change to text
  IntColumn get sort_order => integer().nullable()();
}