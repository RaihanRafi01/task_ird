import 'package:drift/drift.dart';

// Defines the Books table schema for the Drift database.
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

// Defines the Chapter table schema for the Drift database.
class Chapter extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapter_id => integer()();
  IntColumn get book_id => integer()();
  TextColumn get title => text()();
  IntColumn get number => integer()();
  TextColumn get hadis_range => text().nullable()();
  TextColumn get book_name => text()();
}

// Defines the Hadith table schema for the Drift database.
class Hadith extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book_id => integer()();
  TextColumn get book_name => text()();
  IntColumn get chapter_id => integer()();
  IntColumn get section_id => integer().nullable()();
  TextColumn get hadith_key => text()();
  IntColumn get hadith_id => integer()();
  TextColumn get narrator => text().nullable()();
  TextColumn get bn => text().nullable()();
  TextColumn get ar => text().nullable()();
  TextColumn get ar_diacless => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get grade_id => integer().nullable()();
  TextColumn get grade => text().nullable()();
  TextColumn get grade_color => text().nullable()();
}

// Defines the Section table schema for the Drift database.
class Section extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book_id => integer()();
  TextColumn get book_name => text()(); // Schema says integer, assuming text
  IntColumn get chapter_id => integer()();
  IntColumn get section_id => integer()();
  TextColumn get title => text()();
  TextColumn get preface => text().nullable()();
  IntColumn get number => integer().nullable()();
  IntColumn get sort_order => integer().nullable()();
}