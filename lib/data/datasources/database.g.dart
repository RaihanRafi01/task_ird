// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _title_arMeta =
      const VerificationMeta('title_ar');
  @override
  late final GeneratedColumn<String> title_ar = GeneratedColumn<String>(
      'title_ar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _number_of_hadisMeta =
      const VerificationMeta('number_of_hadis');
  @override
  late final GeneratedColumn<int> number_of_hadis = GeneratedColumn<int>(
      'number_of_hadis', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _abvr_codeMeta =
      const VerificationMeta('abvr_code');
  @override
  late final GeneratedColumn<String> abvr_code = GeneratedColumn<String>(
      'abvr_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _book_nameMeta =
      const VerificationMeta('book_name');
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _book_descrMeta =
      const VerificationMeta('book_descr');
  @override
  late final GeneratedColumn<String> book_descr = GeneratedColumn<String>(
      'book_descr', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _color_codeMeta =
      const VerificationMeta('color_code');
  @override
  late final GeneratedColumn<String> color_code = GeneratedColumn<String>(
      'color_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        title_ar,
        number_of_hadis,
        abvr_code,
        book_name,
        book_descr,
        color_code
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_ar')) {
      context.handle(_title_arMeta,
          title_ar.isAcceptableOrUnknown(data['title_ar']!, _title_arMeta));
    } else if (isInserting) {
      context.missing(_title_arMeta);
    }
    if (data.containsKey('number_of_hadis')) {
      context.handle(
          _number_of_hadisMeta,
          number_of_hadis.isAcceptableOrUnknown(
              data['number_of_hadis']!, _number_of_hadisMeta));
    } else if (isInserting) {
      context.missing(_number_of_hadisMeta);
    }
    if (data.containsKey('abvr_code')) {
      context.handle(_abvr_codeMeta,
          abvr_code.isAcceptableOrUnknown(data['abvr_code']!, _abvr_codeMeta));
    } else if (isInserting) {
      context.missing(_abvr_codeMeta);
    }
    if (data.containsKey('book_name')) {
      context.handle(_book_nameMeta,
          book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta));
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    if (data.containsKey('book_descr')) {
      context.handle(
          _book_descrMeta,
          book_descr.isAcceptableOrUnknown(
              data['book_descr']!, _book_descrMeta));
    } else if (isInserting) {
      context.missing(_book_descrMeta);
    }
    if (data.containsKey('color_code')) {
      context.handle(
          _color_codeMeta,
          color_code.isAcceptableOrUnknown(
              data['color_code']!, _color_codeMeta));
    } else if (isInserting) {
      context.missing(_color_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      title_ar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title_ar'])!,
      number_of_hadis: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_hadis'])!,
      abvr_code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}abvr_code'])!,
      book_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
      book_descr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_descr'])!,
      color_code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_code'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String title_ar;
  final int number_of_hadis;
  final String abvr_code;
  final String book_name;
  final String book_descr;
  final String color_code;
  const Book(
      {required this.id,
      required this.title,
      required this.title_ar,
      required this.number_of_hadis,
      required this.abvr_code,
      required this.book_name,
      required this.book_descr,
      required this.color_code});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['title_ar'] = Variable<String>(title_ar);
    map['number_of_hadis'] = Variable<int>(number_of_hadis);
    map['abvr_code'] = Variable<String>(abvr_code);
    map['book_name'] = Variable<String>(book_name);
    map['book_descr'] = Variable<String>(book_descr);
    map['color_code'] = Variable<String>(color_code);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      title_ar: Value(title_ar),
      number_of_hadis: Value(number_of_hadis),
      abvr_code: Value(abvr_code),
      book_name: Value(book_name),
      book_descr: Value(book_descr),
      color_code: Value(color_code),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      title_ar: serializer.fromJson<String>(json['title_ar']),
      number_of_hadis: serializer.fromJson<int>(json['number_of_hadis']),
      abvr_code: serializer.fromJson<String>(json['abvr_code']),
      book_name: serializer.fromJson<String>(json['book_name']),
      book_descr: serializer.fromJson<String>(json['book_descr']),
      color_code: serializer.fromJson<String>(json['color_code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'title_ar': serializer.toJson<String>(title_ar),
      'number_of_hadis': serializer.toJson<int>(number_of_hadis),
      'abvr_code': serializer.toJson<String>(abvr_code),
      'book_name': serializer.toJson<String>(book_name),
      'book_descr': serializer.toJson<String>(book_descr),
      'color_code': serializer.toJson<String>(color_code),
    };
  }

  Book copyWith(
          {int? id,
          String? title,
          String? title_ar,
          int? number_of_hadis,
          String? abvr_code,
          String? book_name,
          String? book_descr,
          String? color_code}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        title_ar: title_ar ?? this.title_ar,
        number_of_hadis: number_of_hadis ?? this.number_of_hadis,
        abvr_code: abvr_code ?? this.abvr_code,
        book_name: book_name ?? this.book_name,
        book_descr: book_descr ?? this.book_descr,
        color_code: color_code ?? this.color_code,
      );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      title_ar: data.title_ar.present ? data.title_ar.value : this.title_ar,
      number_of_hadis: data.number_of_hadis.present
          ? data.number_of_hadis.value
          : this.number_of_hadis,
      abvr_code: data.abvr_code.present ? data.abvr_code.value : this.abvr_code,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
      book_descr:
          data.book_descr.present ? data.book_descr.value : this.book_descr,
      color_code:
          data.color_code.present ? data.color_code.value : this.color_code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('title_ar: $title_ar, ')
          ..write('number_of_hadis: $number_of_hadis, ')
          ..write('abvr_code: $abvr_code, ')
          ..write('book_name: $book_name, ')
          ..write('book_descr: $book_descr, ')
          ..write('color_code: $color_code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, title_ar, number_of_hadis,
      abvr_code, book_name, book_descr, color_code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.title_ar == this.title_ar &&
          other.number_of_hadis == this.number_of_hadis &&
          other.abvr_code == this.abvr_code &&
          other.book_name == this.book_name &&
          other.book_descr == this.book_descr &&
          other.color_code == this.color_code);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> title_ar;
  final Value<int> number_of_hadis;
  final Value<String> abvr_code;
  final Value<String> book_name;
  final Value<String> book_descr;
  final Value<String> color_code;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.title_ar = const Value.absent(),
    this.number_of_hadis = const Value.absent(),
    this.abvr_code = const Value.absent(),
    this.book_name = const Value.absent(),
    this.book_descr = const Value.absent(),
    this.color_code = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String title_ar,
    required int number_of_hadis,
    required String abvr_code,
    required String book_name,
    required String book_descr,
    required String color_code,
  })  : title = Value(title),
        title_ar = Value(title_ar),
        number_of_hadis = Value(number_of_hadis),
        abvr_code = Value(abvr_code),
        book_name = Value(book_name),
        book_descr = Value(book_descr),
        color_code = Value(color_code);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? title_ar,
    Expression<int>? number_of_hadis,
    Expression<String>? abvr_code,
    Expression<String>? book_name,
    Expression<String>? book_descr,
    Expression<String>? color_code,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (title_ar != null) 'title_ar': title_ar,
      if (number_of_hadis != null) 'number_of_hadis': number_of_hadis,
      if (abvr_code != null) 'abvr_code': abvr_code,
      if (book_name != null) 'book_name': book_name,
      if (book_descr != null) 'book_descr': book_descr,
      if (color_code != null) 'color_code': color_code,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? title_ar,
      Value<int>? number_of_hadis,
      Value<String>? abvr_code,
      Value<String>? book_name,
      Value<String>? book_descr,
      Value<String>? color_code}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      title_ar: title_ar ?? this.title_ar,
      number_of_hadis: number_of_hadis ?? this.number_of_hadis,
      abvr_code: abvr_code ?? this.abvr_code,
      book_name: book_name ?? this.book_name,
      book_descr: book_descr ?? this.book_descr,
      color_code: color_code ?? this.color_code,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (title_ar.present) {
      map['title_ar'] = Variable<String>(title_ar.value);
    }
    if (number_of_hadis.present) {
      map['number_of_hadis'] = Variable<int>(number_of_hadis.value);
    }
    if (abvr_code.present) {
      map['abvr_code'] = Variable<String>(abvr_code.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    if (book_descr.present) {
      map['book_descr'] = Variable<String>(book_descr.value);
    }
    if (color_code.present) {
      map['color_code'] = Variable<String>(color_code.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('title_ar: $title_ar, ')
          ..write('number_of_hadis: $number_of_hadis, ')
          ..write('abvr_code: $abvr_code, ')
          ..write('book_name: $book_name, ')
          ..write('book_descr: $book_descr, ')
          ..write('color_code: $color_code')
          ..write(')'))
        .toString();
  }
}

class $ChapterTable extends Chapter with TableInfo<$ChapterTable, ChapterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChapterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chapter_idMeta =
      const VerificationMeta('chapter_id');
  @override
  late final GeneratedColumn<int> chapter_id = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hadis_rangeMeta =
      const VerificationMeta('hadis_range');
  @override
  late final GeneratedColumn<String> hadis_range = GeneratedColumn<String>(
      'hadis_range', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _book_nameMeta =
      const VerificationMeta('book_name');
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, chapter_id, book_id, title, number, hadis_range, book_name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapter';
  @override
  VerificationContext validateIntegrity(Insertable<ChapterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
          _chapter_idMeta,
          chapter_id.isAcceptableOrUnknown(
              data['chapter_id']!, _chapter_idMeta));
    } else if (isInserting) {
      context.missing(_chapter_idMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    } else if (isInserting) {
      context.missing(_book_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('hadis_range')) {
      context.handle(
          _hadis_rangeMeta,
          hadis_range.isAcceptableOrUnknown(
              data['hadis_range']!, _hadis_rangeMeta));
    }
    if (data.containsKey('book_name')) {
      context.handle(_book_nameMeta,
          book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta));
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChapterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChapterData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chapter_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      hadis_range: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hadis_range']),
      book_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
    );
  }

  @override
  $ChapterTable createAlias(String alias) {
    return $ChapterTable(attachedDatabase, alias);
  }
}

class ChapterData extends DataClass implements Insertable<ChapterData> {
  final int id;
  final int chapter_id;
  final int book_id;
  final String title;
  final int number;
  final String? hadis_range;
  final String book_name;
  const ChapterData(
      {required this.id,
      required this.chapter_id,
      required this.book_id,
      required this.title,
      required this.number,
      this.hadis_range,
      required this.book_name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapter_id);
    map['book_id'] = Variable<int>(book_id);
    map['title'] = Variable<String>(title);
    map['number'] = Variable<int>(number);
    if (!nullToAbsent || hadis_range != null) {
      map['hadis_range'] = Variable<String>(hadis_range);
    }
    map['book_name'] = Variable<String>(book_name);
    return map;
  }

  ChapterCompanion toCompanion(bool nullToAbsent) {
    return ChapterCompanion(
      id: Value(id),
      chapter_id: Value(chapter_id),
      book_id: Value(book_id),
      title: Value(title),
      number: Value(number),
      hadis_range: hadis_range == null && nullToAbsent
          ? const Value.absent()
          : Value(hadis_range),
      book_name: Value(book_name),
    );
  }

  factory ChapterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChapterData(
      id: serializer.fromJson<int>(json['id']),
      chapter_id: serializer.fromJson<int>(json['chapter_id']),
      book_id: serializer.fromJson<int>(json['book_id']),
      title: serializer.fromJson<String>(json['title']),
      number: serializer.fromJson<int>(json['number']),
      hadis_range: serializer.fromJson<String?>(json['hadis_range']),
      book_name: serializer.fromJson<String>(json['book_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chapter_id': serializer.toJson<int>(chapter_id),
      'book_id': serializer.toJson<int>(book_id),
      'title': serializer.toJson<String>(title),
      'number': serializer.toJson<int>(number),
      'hadis_range': serializer.toJson<String?>(hadis_range),
      'book_name': serializer.toJson<String>(book_name),
    };
  }

  ChapterData copyWith(
          {int? id,
          int? chapter_id,
          int? book_id,
          String? title,
          int? number,
          Value<String?> hadis_range = const Value.absent(),
          String? book_name}) =>
      ChapterData(
        id: id ?? this.id,
        chapter_id: chapter_id ?? this.chapter_id,
        book_id: book_id ?? this.book_id,
        title: title ?? this.title,
        number: number ?? this.number,
        hadis_range: hadis_range.present ? hadis_range.value : this.hadis_range,
        book_name: book_name ?? this.book_name,
      );
  ChapterData copyWithCompanion(ChapterCompanion data) {
    return ChapterData(
      id: data.id.present ? data.id.value : this.id,
      chapter_id:
          data.chapter_id.present ? data.chapter_id.value : this.chapter_id,
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      title: data.title.present ? data.title.value : this.title,
      number: data.number.present ? data.number.value : this.number,
      hadis_range:
          data.hadis_range.present ? data.hadis_range.value : this.hadis_range,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChapterData(')
          ..write('id: $id, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('book_id: $book_id, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('hadis_range: $hadis_range, ')
          ..write('book_name: $book_name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, chapter_id, book_id, title, number, hadis_range, book_name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChapterData &&
          other.id == this.id &&
          other.chapter_id == this.chapter_id &&
          other.book_id == this.book_id &&
          other.title == this.title &&
          other.number == this.number &&
          other.hadis_range == this.hadis_range &&
          other.book_name == this.book_name);
}

class ChapterCompanion extends UpdateCompanion<ChapterData> {
  final Value<int> id;
  final Value<int> chapter_id;
  final Value<int> book_id;
  final Value<String> title;
  final Value<int> number;
  final Value<String?> hadis_range;
  final Value<String> book_name;
  const ChapterCompanion({
    this.id = const Value.absent(),
    this.chapter_id = const Value.absent(),
    this.book_id = const Value.absent(),
    this.title = const Value.absent(),
    this.number = const Value.absent(),
    this.hadis_range = const Value.absent(),
    this.book_name = const Value.absent(),
  });
  ChapterCompanion.insert({
    this.id = const Value.absent(),
    required int chapter_id,
    required int book_id,
    required String title,
    required int number,
    this.hadis_range = const Value.absent(),
    required String book_name,
  })  : chapter_id = Value(chapter_id),
        book_id = Value(book_id),
        title = Value(title),
        number = Value(number),
        book_name = Value(book_name);
  static Insertable<ChapterData> custom({
    Expression<int>? id,
    Expression<int>? chapter_id,
    Expression<int>? book_id,
    Expression<String>? title,
    Expression<int>? number,
    Expression<String>? hadis_range,
    Expression<String>? book_name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapter_id != null) 'chapter_id': chapter_id,
      if (book_id != null) 'book_id': book_id,
      if (title != null) 'title': title,
      if (number != null) 'number': number,
      if (hadis_range != null) 'hadis_range': hadis_range,
      if (book_name != null) 'book_name': book_name,
    });
  }

  ChapterCompanion copyWith(
      {Value<int>? id,
      Value<int>? chapter_id,
      Value<int>? book_id,
      Value<String>? title,
      Value<int>? number,
      Value<String?>? hadis_range,
      Value<String>? book_name}) {
    return ChapterCompanion(
      id: id ?? this.id,
      chapter_id: chapter_id ?? this.chapter_id,
      book_id: book_id ?? this.book_id,
      title: title ?? this.title,
      number: number ?? this.number,
      hadis_range: hadis_range ?? this.hadis_range,
      book_name: book_name ?? this.book_name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chapter_id.present) {
      map['chapter_id'] = Variable<int>(chapter_id.value);
    }
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (hadis_range.present) {
      map['hadis_range'] = Variable<String>(hadis_range.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChapterCompanion(')
          ..write('id: $id, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('book_id: $book_id, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('hadis_range: $hadis_range, ')
          ..write('book_name: $book_name')
          ..write(')'))
        .toString();
  }
}

class $HadithTable extends Hadith with TableInfo<$HadithTable, HadithData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HadithTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _book_nameMeta =
      const VerificationMeta('book_name');
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chapter_idMeta =
      const VerificationMeta('chapter_id');
  @override
  late final GeneratedColumn<int> chapter_id = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _section_idMeta =
      const VerificationMeta('section_id');
  @override
  late final GeneratedColumn<int> section_id = GeneratedColumn<int>(
      'section_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hadith_keyMeta =
      const VerificationMeta('hadith_key');
  @override
  late final GeneratedColumn<String> hadith_key = GeneratedColumn<String>(
      'hadith_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hadith_idMeta =
      const VerificationMeta('hadith_id');
  @override
  late final GeneratedColumn<int> hadith_id = GeneratedColumn<int>(
      'hadith_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _narratorMeta =
      const VerificationMeta('narrator');
  @override
  late final GeneratedColumn<String> narrator = GeneratedColumn<String>(
      'narrator', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bnMeta = const VerificationMeta('bn');
  @override
  late final GeneratedColumn<String> bn = GeneratedColumn<String>(
      'bn', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _arMeta = const VerificationMeta('ar');
  @override
  late final GeneratedColumn<String> ar = GeneratedColumn<String>(
      'ar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ar_diaclessMeta =
      const VerificationMeta('ar_diacless');
  @override
  late final GeneratedColumn<String> ar_diacless = GeneratedColumn<String>(
      'ar_diacless', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _grade_idMeta =
      const VerificationMeta('grade_id');
  @override
  late final GeneratedColumn<int> grade_id = GeneratedColumn<int>(
      'grade_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
      'grade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _grade_colorMeta =
      const VerificationMeta('grade_color');
  @override
  late final GeneratedColumn<String> grade_color = GeneratedColumn<String>(
      'grade_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        book_id,
        book_name,
        chapter_id,
        section_id,
        hadith_key,
        hadith_id,
        narrator,
        bn,
        ar,
        ar_diacless,
        note,
        grade_id,
        grade,
        grade_color
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hadith';
  @override
  VerificationContext validateIntegrity(Insertable<HadithData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    } else if (isInserting) {
      context.missing(_book_idMeta);
    }
    if (data.containsKey('book_name')) {
      context.handle(_book_nameMeta,
          book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta));
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
          _chapter_idMeta,
          chapter_id.isAcceptableOrUnknown(
              data['chapter_id']!, _chapter_idMeta));
    } else if (isInserting) {
      context.missing(_chapter_idMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
          _section_idMeta,
          section_id.isAcceptableOrUnknown(
              data['section_id']!, _section_idMeta));
    }
    if (data.containsKey('hadith_key')) {
      context.handle(
          _hadith_keyMeta,
          hadith_key.isAcceptableOrUnknown(
              data['hadith_key']!, _hadith_keyMeta));
    } else if (isInserting) {
      context.missing(_hadith_keyMeta);
    }
    if (data.containsKey('hadith_id')) {
      context.handle(_hadith_idMeta,
          hadith_id.isAcceptableOrUnknown(data['hadith_id']!, _hadith_idMeta));
    } else if (isInserting) {
      context.missing(_hadith_idMeta);
    }
    if (data.containsKey('narrator')) {
      context.handle(_narratorMeta,
          narrator.isAcceptableOrUnknown(data['narrator']!, _narratorMeta));
    }
    if (data.containsKey('bn')) {
      context.handle(_bnMeta, bn.isAcceptableOrUnknown(data['bn']!, _bnMeta));
    }
    if (data.containsKey('ar')) {
      context.handle(_arMeta, ar.isAcceptableOrUnknown(data['ar']!, _arMeta));
    }
    if (data.containsKey('ar_diacless')) {
      context.handle(
          _ar_diaclessMeta,
          ar_diacless.isAcceptableOrUnknown(
              data['ar_diacless']!, _ar_diaclessMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('grade_id')) {
      context.handle(_grade_idMeta,
          grade_id.isAcceptableOrUnknown(data['grade_id']!, _grade_idMeta));
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    }
    if (data.containsKey('grade_color')) {
      context.handle(
          _grade_colorMeta,
          grade_color.isAcceptableOrUnknown(
              data['grade_color']!, _grade_colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HadithData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HadithData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      book_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
      chapter_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      section_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}section_id']),
      hadith_key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hadith_key'])!,
      hadith_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hadith_id'])!,
      narrator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}narrator']),
      bn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bn']),
      ar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ar']),
      ar_diacless: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ar_diacless']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      grade_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_id']),
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade']),
      grade_color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade_color']),
    );
  }

  @override
  $HadithTable createAlias(String alias) {
    return $HadithTable(attachedDatabase, alias);
  }
}

class HadithData extends DataClass implements Insertable<HadithData> {
  final int id;
  final int book_id;
  final String book_name;
  final int chapter_id;
  final int? section_id;
  final String hadith_key;
  final int hadith_id;
  final String? narrator;
  final String? bn;
  final String? ar;
  final String? ar_diacless;
  final String? note;
  final int? grade_id;
  final String? grade;
  final String? grade_color;
  const HadithData(
      {required this.id,
      required this.book_id,
      required this.book_name,
      required this.chapter_id,
      this.section_id,
      required this.hadith_key,
      required this.hadith_id,
      this.narrator,
      this.bn,
      this.ar,
      this.ar_diacless,
      this.note,
      this.grade_id,
      this.grade,
      this.grade_color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(book_id);
    map['book_name'] = Variable<String>(book_name);
    map['chapter_id'] = Variable<int>(chapter_id);
    if (!nullToAbsent || section_id != null) {
      map['section_id'] = Variable<int>(section_id);
    }
    map['hadith_key'] = Variable<String>(hadith_key);
    map['hadith_id'] = Variable<int>(hadith_id);
    if (!nullToAbsent || narrator != null) {
      map['narrator'] = Variable<String>(narrator);
    }
    if (!nullToAbsent || bn != null) {
      map['bn'] = Variable<String>(bn);
    }
    if (!nullToAbsent || ar != null) {
      map['ar'] = Variable<String>(ar);
    }
    if (!nullToAbsent || ar_diacless != null) {
      map['ar_diacless'] = Variable<String>(ar_diacless);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || grade_id != null) {
      map['grade_id'] = Variable<int>(grade_id);
    }
    if (!nullToAbsent || grade != null) {
      map['grade'] = Variable<String>(grade);
    }
    if (!nullToAbsent || grade_color != null) {
      map['grade_color'] = Variable<String>(grade_color);
    }
    return map;
  }

  HadithCompanion toCompanion(bool nullToAbsent) {
    return HadithCompanion(
      id: Value(id),
      book_id: Value(book_id),
      book_name: Value(book_name),
      chapter_id: Value(chapter_id),
      section_id: section_id == null && nullToAbsent
          ? const Value.absent()
          : Value(section_id),
      hadith_key: Value(hadith_key),
      hadith_id: Value(hadith_id),
      narrator: narrator == null && nullToAbsent
          ? const Value.absent()
          : Value(narrator),
      bn: bn == null && nullToAbsent ? const Value.absent() : Value(bn),
      ar: ar == null && nullToAbsent ? const Value.absent() : Value(ar),
      ar_diacless: ar_diacless == null && nullToAbsent
          ? const Value.absent()
          : Value(ar_diacless),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      grade_id: grade_id == null && nullToAbsent
          ? const Value.absent()
          : Value(grade_id),
      grade:
          grade == null && nullToAbsent ? const Value.absent() : Value(grade),
      grade_color: grade_color == null && nullToAbsent
          ? const Value.absent()
          : Value(grade_color),
    );
  }

  factory HadithData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HadithData(
      id: serializer.fromJson<int>(json['id']),
      book_id: serializer.fromJson<int>(json['book_id']),
      book_name: serializer.fromJson<String>(json['book_name']),
      chapter_id: serializer.fromJson<int>(json['chapter_id']),
      section_id: serializer.fromJson<int?>(json['section_id']),
      hadith_key: serializer.fromJson<String>(json['hadith_key']),
      hadith_id: serializer.fromJson<int>(json['hadith_id']),
      narrator: serializer.fromJson<String?>(json['narrator']),
      bn: serializer.fromJson<String?>(json['bn']),
      ar: serializer.fromJson<String?>(json['ar']),
      ar_diacless: serializer.fromJson<String?>(json['ar_diacless']),
      note: serializer.fromJson<String?>(json['note']),
      grade_id: serializer.fromJson<int?>(json['grade_id']),
      grade: serializer.fromJson<String?>(json['grade']),
      grade_color: serializer.fromJson<String?>(json['grade_color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book_id': serializer.toJson<int>(book_id),
      'book_name': serializer.toJson<String>(book_name),
      'chapter_id': serializer.toJson<int>(chapter_id),
      'section_id': serializer.toJson<int?>(section_id),
      'hadith_key': serializer.toJson<String>(hadith_key),
      'hadith_id': serializer.toJson<int>(hadith_id),
      'narrator': serializer.toJson<String?>(narrator),
      'bn': serializer.toJson<String?>(bn),
      'ar': serializer.toJson<String?>(ar),
      'ar_diacless': serializer.toJson<String?>(ar_diacless),
      'note': serializer.toJson<String?>(note),
      'grade_id': serializer.toJson<int?>(grade_id),
      'grade': serializer.toJson<String?>(grade),
      'grade_color': serializer.toJson<String?>(grade_color),
    };
  }

  HadithData copyWith(
          {int? id,
          int? book_id,
          String? book_name,
          int? chapter_id,
          Value<int?> section_id = const Value.absent(),
          String? hadith_key,
          int? hadith_id,
          Value<String?> narrator = const Value.absent(),
          Value<String?> bn = const Value.absent(),
          Value<String?> ar = const Value.absent(),
          Value<String?> ar_diacless = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<int?> grade_id = const Value.absent(),
          Value<String?> grade = const Value.absent(),
          Value<String?> grade_color = const Value.absent()}) =>
      HadithData(
        id: id ?? this.id,
        book_id: book_id ?? this.book_id,
        book_name: book_name ?? this.book_name,
        chapter_id: chapter_id ?? this.chapter_id,
        section_id: section_id.present ? section_id.value : this.section_id,
        hadith_key: hadith_key ?? this.hadith_key,
        hadith_id: hadith_id ?? this.hadith_id,
        narrator: narrator.present ? narrator.value : this.narrator,
        bn: bn.present ? bn.value : this.bn,
        ar: ar.present ? ar.value : this.ar,
        ar_diacless: ar_diacless.present ? ar_diacless.value : this.ar_diacless,
        note: note.present ? note.value : this.note,
        grade_id: grade_id.present ? grade_id.value : this.grade_id,
        grade: grade.present ? grade.value : this.grade,
        grade_color: grade_color.present ? grade_color.value : this.grade_color,
      );
  HadithData copyWithCompanion(HadithCompanion data) {
    return HadithData(
      id: data.id.present ? data.id.value : this.id,
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
      chapter_id:
          data.chapter_id.present ? data.chapter_id.value : this.chapter_id,
      section_id:
          data.section_id.present ? data.section_id.value : this.section_id,
      hadith_key:
          data.hadith_key.present ? data.hadith_key.value : this.hadith_key,
      hadith_id: data.hadith_id.present ? data.hadith_id.value : this.hadith_id,
      narrator: data.narrator.present ? data.narrator.value : this.narrator,
      bn: data.bn.present ? data.bn.value : this.bn,
      ar: data.ar.present ? data.ar.value : this.ar,
      ar_diacless:
          data.ar_diacless.present ? data.ar_diacless.value : this.ar_diacless,
      note: data.note.present ? data.note.value : this.note,
      grade_id: data.grade_id.present ? data.grade_id.value : this.grade_id,
      grade: data.grade.present ? data.grade.value : this.grade,
      grade_color:
          data.grade_color.present ? data.grade_color.value : this.grade_color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HadithData(')
          ..write('id: $id, ')
          ..write('book_id: $book_id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('section_id: $section_id, ')
          ..write('hadith_key: $hadith_key, ')
          ..write('hadith_id: $hadith_id, ')
          ..write('narrator: $narrator, ')
          ..write('bn: $bn, ')
          ..write('ar: $ar, ')
          ..write('ar_diacless: $ar_diacless, ')
          ..write('note: $note, ')
          ..write('grade_id: $grade_id, ')
          ..write('grade: $grade, ')
          ..write('grade_color: $grade_color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      book_id,
      book_name,
      chapter_id,
      section_id,
      hadith_key,
      hadith_id,
      narrator,
      bn,
      ar,
      ar_diacless,
      note,
      grade_id,
      grade,
      grade_color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HadithData &&
          other.id == this.id &&
          other.book_id == this.book_id &&
          other.book_name == this.book_name &&
          other.chapter_id == this.chapter_id &&
          other.section_id == this.section_id &&
          other.hadith_key == this.hadith_key &&
          other.hadith_id == this.hadith_id &&
          other.narrator == this.narrator &&
          other.bn == this.bn &&
          other.ar == this.ar &&
          other.ar_diacless == this.ar_diacless &&
          other.note == this.note &&
          other.grade_id == this.grade_id &&
          other.grade == this.grade &&
          other.grade_color == this.grade_color);
}

class HadithCompanion extends UpdateCompanion<HadithData> {
  final Value<int> id;
  final Value<int> book_id;
  final Value<String> book_name;
  final Value<int> chapter_id;
  final Value<int?> section_id;
  final Value<String> hadith_key;
  final Value<int> hadith_id;
  final Value<String?> narrator;
  final Value<String?> bn;
  final Value<String?> ar;
  final Value<String?> ar_diacless;
  final Value<String?> note;
  final Value<int?> grade_id;
  final Value<String?> grade;
  final Value<String?> grade_color;
  const HadithCompanion({
    this.id = const Value.absent(),
    this.book_id = const Value.absent(),
    this.book_name = const Value.absent(),
    this.chapter_id = const Value.absent(),
    this.section_id = const Value.absent(),
    this.hadith_key = const Value.absent(),
    this.hadith_id = const Value.absent(),
    this.narrator = const Value.absent(),
    this.bn = const Value.absent(),
    this.ar = const Value.absent(),
    this.ar_diacless = const Value.absent(),
    this.note = const Value.absent(),
    this.grade_id = const Value.absent(),
    this.grade = const Value.absent(),
    this.grade_color = const Value.absent(),
  });
  HadithCompanion.insert({
    this.id = const Value.absent(),
    required int book_id,
    required String book_name,
    required int chapter_id,
    this.section_id = const Value.absent(),
    required String hadith_key,
    required int hadith_id,
    this.narrator = const Value.absent(),
    this.bn = const Value.absent(),
    this.ar = const Value.absent(),
    this.ar_diacless = const Value.absent(),
    this.note = const Value.absent(),
    this.grade_id = const Value.absent(),
    this.grade = const Value.absent(),
    this.grade_color = const Value.absent(),
  })  : book_id = Value(book_id),
        book_name = Value(book_name),
        chapter_id = Value(chapter_id),
        hadith_key = Value(hadith_key),
        hadith_id = Value(hadith_id);
  static Insertable<HadithData> custom({
    Expression<int>? id,
    Expression<int>? book_id,
    Expression<String>? book_name,
    Expression<int>? chapter_id,
    Expression<int>? section_id,
    Expression<String>? hadith_key,
    Expression<int>? hadith_id,
    Expression<String>? narrator,
    Expression<String>? bn,
    Expression<String>? ar,
    Expression<String>? ar_diacless,
    Expression<String>? note,
    Expression<int>? grade_id,
    Expression<String>? grade,
    Expression<String>? grade_color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book_id != null) 'book_id': book_id,
      if (book_name != null) 'book_name': book_name,
      if (chapter_id != null) 'chapter_id': chapter_id,
      if (section_id != null) 'section_id': section_id,
      if (hadith_key != null) 'hadith_key': hadith_key,
      if (hadith_id != null) 'hadith_id': hadith_id,
      if (narrator != null) 'narrator': narrator,
      if (bn != null) 'bn': bn,
      if (ar != null) 'ar': ar,
      if (ar_diacless != null) 'ar_diacless': ar_diacless,
      if (note != null) 'note': note,
      if (grade_id != null) 'grade_id': grade_id,
      if (grade != null) 'grade': grade,
      if (grade_color != null) 'grade_color': grade_color,
    });
  }

  HadithCompanion copyWith(
      {Value<int>? id,
      Value<int>? book_id,
      Value<String>? book_name,
      Value<int>? chapter_id,
      Value<int?>? section_id,
      Value<String>? hadith_key,
      Value<int>? hadith_id,
      Value<String?>? narrator,
      Value<String?>? bn,
      Value<String?>? ar,
      Value<String?>? ar_diacless,
      Value<String?>? note,
      Value<int?>? grade_id,
      Value<String?>? grade,
      Value<String?>? grade_color}) {
    return HadithCompanion(
      id: id ?? this.id,
      book_id: book_id ?? this.book_id,
      book_name: book_name ?? this.book_name,
      chapter_id: chapter_id ?? this.chapter_id,
      section_id: section_id ?? this.section_id,
      hadith_key: hadith_key ?? this.hadith_key,
      hadith_id: hadith_id ?? this.hadith_id,
      narrator: narrator ?? this.narrator,
      bn: bn ?? this.bn,
      ar: ar ?? this.ar,
      ar_diacless: ar_diacless ?? this.ar_diacless,
      note: note ?? this.note,
      grade_id: grade_id ?? this.grade_id,
      grade: grade ?? this.grade,
      grade_color: grade_color ?? this.grade_color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    if (chapter_id.present) {
      map['chapter_id'] = Variable<int>(chapter_id.value);
    }
    if (section_id.present) {
      map['section_id'] = Variable<int>(section_id.value);
    }
    if (hadith_key.present) {
      map['hadith_key'] = Variable<String>(hadith_key.value);
    }
    if (hadith_id.present) {
      map['hadith_id'] = Variable<int>(hadith_id.value);
    }
    if (narrator.present) {
      map['narrator'] = Variable<String>(narrator.value);
    }
    if (bn.present) {
      map['bn'] = Variable<String>(bn.value);
    }
    if (ar.present) {
      map['ar'] = Variable<String>(ar.value);
    }
    if (ar_diacless.present) {
      map['ar_diacless'] = Variable<String>(ar_diacless.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (grade_id.present) {
      map['grade_id'] = Variable<int>(grade_id.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (grade_color.present) {
      map['grade_color'] = Variable<String>(grade_color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HadithCompanion(')
          ..write('id: $id, ')
          ..write('book_id: $book_id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('section_id: $section_id, ')
          ..write('hadith_key: $hadith_key, ')
          ..write('hadith_id: $hadith_id, ')
          ..write('narrator: $narrator, ')
          ..write('bn: $bn, ')
          ..write('ar: $ar, ')
          ..write('ar_diacless: $ar_diacless, ')
          ..write('note: $note, ')
          ..write('grade_id: $grade_id, ')
          ..write('grade: $grade, ')
          ..write('grade_color: $grade_color')
          ..write(')'))
        .toString();
  }
}

class $SectionTable extends Section with TableInfo<$SectionTable, SectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _book_idMeta =
      const VerificationMeta('book_id');
  @override
  late final GeneratedColumn<int> book_id = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _book_nameMeta =
      const VerificationMeta('book_name');
  @override
  late final GeneratedColumn<String> book_name = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chapter_idMeta =
      const VerificationMeta('chapter_id');
  @override
  late final GeneratedColumn<int> chapter_id = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _section_idMeta =
      const VerificationMeta('section_id');
  @override
  late final GeneratedColumn<int> section_id = GeneratedColumn<int>(
      'section_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prefaceMeta =
      const VerificationMeta('preface');
  @override
  late final GeneratedColumn<String> preface = GeneratedColumn<String>(
      'preface', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sort_orderMeta =
      const VerificationMeta('sort_order');
  @override
  late final GeneratedColumn<int> sort_order = GeneratedColumn<int>(
      'sort_order', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        book_id,
        book_name,
        chapter_id,
        section_id,
        title,
        preface,
        number,
        sort_order
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'section';
  @override
  VerificationContext validateIntegrity(Insertable<SectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_book_idMeta,
          book_id.isAcceptableOrUnknown(data['book_id']!, _book_idMeta));
    } else if (isInserting) {
      context.missing(_book_idMeta);
    }
    if (data.containsKey('book_name')) {
      context.handle(_book_nameMeta,
          book_name.isAcceptableOrUnknown(data['book_name']!, _book_nameMeta));
    } else if (isInserting) {
      context.missing(_book_nameMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
          _chapter_idMeta,
          chapter_id.isAcceptableOrUnknown(
              data['chapter_id']!, _chapter_idMeta));
    } else if (isInserting) {
      context.missing(_chapter_idMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
          _section_idMeta,
          section_id.isAcceptableOrUnknown(
              data['section_id']!, _section_idMeta));
    } else if (isInserting) {
      context.missing(_section_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('preface')) {
      context.handle(_prefaceMeta,
          preface.isAcceptableOrUnknown(data['preface']!, _prefaceMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(
          _sort_orderMeta,
          sort_order.isAcceptableOrUnknown(
              data['sort_order']!, _sort_orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SectionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      book_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      book_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
      chapter_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      section_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}section_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      preface: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preface']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number']),
      sort_order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order']),
    );
  }

  @override
  $SectionTable createAlias(String alias) {
    return $SectionTable(attachedDatabase, alias);
  }
}

class SectionData extends DataClass implements Insertable<SectionData> {
  final int id;
  final int book_id;
  final String book_name;
  final int chapter_id;
  final int section_id;
  final String title;
  final String? preface;
  final int? number;
  final int? sort_order;
  const SectionData(
      {required this.id,
      required this.book_id,
      required this.book_name,
      required this.chapter_id,
      required this.section_id,
      required this.title,
      this.preface,
      this.number,
      this.sort_order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(book_id);
    map['book_name'] = Variable<String>(book_name);
    map['chapter_id'] = Variable<int>(chapter_id);
    map['section_id'] = Variable<int>(section_id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || preface != null) {
      map['preface'] = Variable<String>(preface);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    if (!nullToAbsent || sort_order != null) {
      map['sort_order'] = Variable<int>(sort_order);
    }
    return map;
  }

  SectionCompanion toCompanion(bool nullToAbsent) {
    return SectionCompanion(
      id: Value(id),
      book_id: Value(book_id),
      book_name: Value(book_name),
      chapter_id: Value(chapter_id),
      section_id: Value(section_id),
      title: Value(title),
      preface: preface == null && nullToAbsent
          ? const Value.absent()
          : Value(preface),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      sort_order: sort_order == null && nullToAbsent
          ? const Value.absent()
          : Value(sort_order),
    );
  }

  factory SectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SectionData(
      id: serializer.fromJson<int>(json['id']),
      book_id: serializer.fromJson<int>(json['book_id']),
      book_name: serializer.fromJson<String>(json['book_name']),
      chapter_id: serializer.fromJson<int>(json['chapter_id']),
      section_id: serializer.fromJson<int>(json['section_id']),
      title: serializer.fromJson<String>(json['title']),
      preface: serializer.fromJson<String?>(json['preface']),
      number: serializer.fromJson<int?>(json['number']),
      sort_order: serializer.fromJson<int?>(json['sort_order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book_id': serializer.toJson<int>(book_id),
      'book_name': serializer.toJson<String>(book_name),
      'chapter_id': serializer.toJson<int>(chapter_id),
      'section_id': serializer.toJson<int>(section_id),
      'title': serializer.toJson<String>(title),
      'preface': serializer.toJson<String?>(preface),
      'number': serializer.toJson<int?>(number),
      'sort_order': serializer.toJson<int?>(sort_order),
    };
  }

  SectionData copyWith(
          {int? id,
          int? book_id,
          String? book_name,
          int? chapter_id,
          int? section_id,
          String? title,
          Value<String?> preface = const Value.absent(),
          Value<int?> number = const Value.absent(),
          Value<int?> sort_order = const Value.absent()}) =>
      SectionData(
        id: id ?? this.id,
        book_id: book_id ?? this.book_id,
        book_name: book_name ?? this.book_name,
        chapter_id: chapter_id ?? this.chapter_id,
        section_id: section_id ?? this.section_id,
        title: title ?? this.title,
        preface: preface.present ? preface.value : this.preface,
        number: number.present ? number.value : this.number,
        sort_order: sort_order.present ? sort_order.value : this.sort_order,
      );
  SectionData copyWithCompanion(SectionCompanion data) {
    return SectionData(
      id: data.id.present ? data.id.value : this.id,
      book_id: data.book_id.present ? data.book_id.value : this.book_id,
      book_name: data.book_name.present ? data.book_name.value : this.book_name,
      chapter_id:
          data.chapter_id.present ? data.chapter_id.value : this.chapter_id,
      section_id:
          data.section_id.present ? data.section_id.value : this.section_id,
      title: data.title.present ? data.title.value : this.title,
      preface: data.preface.present ? data.preface.value : this.preface,
      number: data.number.present ? data.number.value : this.number,
      sort_order:
          data.sort_order.present ? data.sort_order.value : this.sort_order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SectionData(')
          ..write('id: $id, ')
          ..write('book_id: $book_id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('section_id: $section_id, ')
          ..write('title: $title, ')
          ..write('preface: $preface, ')
          ..write('number: $number, ')
          ..write('sort_order: $sort_order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, book_id, book_name, chapter_id,
      section_id, title, preface, number, sort_order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SectionData &&
          other.id == this.id &&
          other.book_id == this.book_id &&
          other.book_name == this.book_name &&
          other.chapter_id == this.chapter_id &&
          other.section_id == this.section_id &&
          other.title == this.title &&
          other.preface == this.preface &&
          other.number == this.number &&
          other.sort_order == this.sort_order);
}

class SectionCompanion extends UpdateCompanion<SectionData> {
  final Value<int> id;
  final Value<int> book_id;
  final Value<String> book_name;
  final Value<int> chapter_id;
  final Value<int> section_id;
  final Value<String> title;
  final Value<String?> preface;
  final Value<int?> number;
  final Value<int?> sort_order;
  const SectionCompanion({
    this.id = const Value.absent(),
    this.book_id = const Value.absent(),
    this.book_name = const Value.absent(),
    this.chapter_id = const Value.absent(),
    this.section_id = const Value.absent(),
    this.title = const Value.absent(),
    this.preface = const Value.absent(),
    this.number = const Value.absent(),
    this.sort_order = const Value.absent(),
  });
  SectionCompanion.insert({
    this.id = const Value.absent(),
    required int book_id,
    required String book_name,
    required int chapter_id,
    required int section_id,
    required String title,
    this.preface = const Value.absent(),
    this.number = const Value.absent(),
    this.sort_order = const Value.absent(),
  })  : book_id = Value(book_id),
        book_name = Value(book_name),
        chapter_id = Value(chapter_id),
        section_id = Value(section_id),
        title = Value(title);
  static Insertable<SectionData> custom({
    Expression<int>? id,
    Expression<int>? book_id,
    Expression<String>? book_name,
    Expression<int>? chapter_id,
    Expression<int>? section_id,
    Expression<String>? title,
    Expression<String>? preface,
    Expression<int>? number,
    Expression<int>? sort_order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book_id != null) 'book_id': book_id,
      if (book_name != null) 'book_name': book_name,
      if (chapter_id != null) 'chapter_id': chapter_id,
      if (section_id != null) 'section_id': section_id,
      if (title != null) 'title': title,
      if (preface != null) 'preface': preface,
      if (number != null) 'number': number,
      if (sort_order != null) 'sort_order': sort_order,
    });
  }

  SectionCompanion copyWith(
      {Value<int>? id,
      Value<int>? book_id,
      Value<String>? book_name,
      Value<int>? chapter_id,
      Value<int>? section_id,
      Value<String>? title,
      Value<String?>? preface,
      Value<int?>? number,
      Value<int?>? sort_order}) {
    return SectionCompanion(
      id: id ?? this.id,
      book_id: book_id ?? this.book_id,
      book_name: book_name ?? this.book_name,
      chapter_id: chapter_id ?? this.chapter_id,
      section_id: section_id ?? this.section_id,
      title: title ?? this.title,
      preface: preface ?? this.preface,
      number: number ?? this.number,
      sort_order: sort_order ?? this.sort_order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (book_id.present) {
      map['book_id'] = Variable<int>(book_id.value);
    }
    if (book_name.present) {
      map['book_name'] = Variable<String>(book_name.value);
    }
    if (chapter_id.present) {
      map['chapter_id'] = Variable<int>(chapter_id.value);
    }
    if (section_id.present) {
      map['section_id'] = Variable<int>(section_id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (preface.present) {
      map['preface'] = Variable<String>(preface.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (sort_order.present) {
      map['sort_order'] = Variable<int>(sort_order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionCompanion(')
          ..write('id: $id, ')
          ..write('book_id: $book_id, ')
          ..write('book_name: $book_name, ')
          ..write('chapter_id: $chapter_id, ')
          ..write('section_id: $section_id, ')
          ..write('title: $title, ')
          ..write('preface: $preface, ')
          ..write('number: $number, ')
          ..write('sort_order: $sort_order')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $ChapterTable chapter = $ChapterTable(this);
  late final $HadithTable hadith = $HadithTable(this);
  late final $SectionTable section = $SectionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [books, chapter, hadith, section];
}

typedef $$BooksTableCreateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  required String title,
  required String title_ar,
  required int number_of_hadis,
  required String abvr_code,
  required String book_name,
  required String book_descr,
  required String color_code,
});
typedef $$BooksTableUpdateCompanionBuilder = BooksCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> title_ar,
  Value<int> number_of_hadis,
  Value<String> abvr_code,
  Value<String> book_name,
  Value<String> book_descr,
  Value<String> color_code,
});

class $$BooksTableFilterComposer extends Composer<_$MyDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title_ar => $composableBuilder(
      column: $table.title_ar, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number_of_hadis => $composableBuilder(
      column: $table.number_of_hadis,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get abvr_code => $composableBuilder(
      column: $table.abvr_code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_descr => $composableBuilder(
      column: $table.book_descr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color_code => $composableBuilder(
      column: $table.color_code, builder: (column) => ColumnFilters(column));
}

class $$BooksTableOrderingComposer extends Composer<_$MyDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title_ar => $composableBuilder(
      column: $table.title_ar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number_of_hadis => $composableBuilder(
      column: $table.number_of_hadis,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get abvr_code => $composableBuilder(
      column: $table.abvr_code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_descr => $composableBuilder(
      column: $table.book_descr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color_code => $composableBuilder(
      column: $table.color_code, builder: (column) => ColumnOrderings(column));
}

class $$BooksTableAnnotationComposer
    extends Composer<_$MyDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get title_ar =>
      $composableBuilder(column: $table.title_ar, builder: (column) => column);

  GeneratedColumn<int> get number_of_hadis => $composableBuilder(
      column: $table.number_of_hadis, builder: (column) => column);

  GeneratedColumn<String> get abvr_code =>
      $composableBuilder(column: $table.abvr_code, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);

  GeneratedColumn<String> get book_descr => $composableBuilder(
      column: $table.book_descr, builder: (column) => column);

  GeneratedColumn<String> get color_code => $composableBuilder(
      column: $table.color_code, builder: (column) => column);
}

class $$BooksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$MyDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()> {
  $$BooksTableTableManager(_$MyDatabase db, $BooksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> title_ar = const Value.absent(),
            Value<int> number_of_hadis = const Value.absent(),
            Value<String> abvr_code = const Value.absent(),
            Value<String> book_name = const Value.absent(),
            Value<String> book_descr = const Value.absent(),
            Value<String> color_code = const Value.absent(),
          }) =>
              BooksCompanion(
            id: id,
            title: title,
            title_ar: title_ar,
            number_of_hadis: number_of_hadis,
            abvr_code: abvr_code,
            book_name: book_name,
            book_descr: book_descr,
            color_code: color_code,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String title_ar,
            required int number_of_hadis,
            required String abvr_code,
            required String book_name,
            required String book_descr,
            required String color_code,
          }) =>
              BooksCompanion.insert(
            id: id,
            title: title,
            title_ar: title_ar,
            number_of_hadis: number_of_hadis,
            abvr_code: abvr_code,
            book_name: book_name,
            book_descr: book_descr,
            color_code: color_code,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BooksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$MyDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()>;
typedef $$ChapterTableCreateCompanionBuilder = ChapterCompanion Function({
  Value<int> id,
  required int chapter_id,
  required int book_id,
  required String title,
  required int number,
  Value<String?> hadis_range,
  required String book_name,
});
typedef $$ChapterTableUpdateCompanionBuilder = ChapterCompanion Function({
  Value<int> id,
  Value<int> chapter_id,
  Value<int> book_id,
  Value<String> title,
  Value<int> number,
  Value<String?> hadis_range,
  Value<String> book_name,
});

class $$ChapterTableFilterComposer
    extends Composer<_$MyDatabase, $ChapterTable> {
  $$ChapterTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hadis_range => $composableBuilder(
      column: $table.hadis_range, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnFilters(column));
}

class $$ChapterTableOrderingComposer
    extends Composer<_$MyDatabase, $ChapterTable> {
  $$ChapterTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hadis_range => $composableBuilder(
      column: $table.hadis_range, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnOrderings(column));
}

class $$ChapterTableAnnotationComposer
    extends Composer<_$MyDatabase, $ChapterTable> {
  $$ChapterTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => column);

  GeneratedColumn<int> get book_id =>
      $composableBuilder(column: $table.book_id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get hadis_range => $composableBuilder(
      column: $table.hadis_range, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);
}

class $$ChapterTableTableManager extends RootTableManager<
    _$MyDatabase,
    $ChapterTable,
    ChapterData,
    $$ChapterTableFilterComposer,
    $$ChapterTableOrderingComposer,
    $$ChapterTableAnnotationComposer,
    $$ChapterTableCreateCompanionBuilder,
    $$ChapterTableUpdateCompanionBuilder,
    (ChapterData, BaseReferences<_$MyDatabase, $ChapterTable, ChapterData>),
    ChapterData,
    PrefetchHooks Function()> {
  $$ChapterTableTableManager(_$MyDatabase db, $ChapterTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChapterTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChapterTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChapterTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> chapter_id = const Value.absent(),
            Value<int> book_id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> number = const Value.absent(),
            Value<String?> hadis_range = const Value.absent(),
            Value<String> book_name = const Value.absent(),
          }) =>
              ChapterCompanion(
            id: id,
            chapter_id: chapter_id,
            book_id: book_id,
            title: title,
            number: number,
            hadis_range: hadis_range,
            book_name: book_name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int chapter_id,
            required int book_id,
            required String title,
            required int number,
            Value<String?> hadis_range = const Value.absent(),
            required String book_name,
          }) =>
              ChapterCompanion.insert(
            id: id,
            chapter_id: chapter_id,
            book_id: book_id,
            title: title,
            number: number,
            hadis_range: hadis_range,
            book_name: book_name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChapterTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $ChapterTable,
    ChapterData,
    $$ChapterTableFilterComposer,
    $$ChapterTableOrderingComposer,
    $$ChapterTableAnnotationComposer,
    $$ChapterTableCreateCompanionBuilder,
    $$ChapterTableUpdateCompanionBuilder,
    (ChapterData, BaseReferences<_$MyDatabase, $ChapterTable, ChapterData>),
    ChapterData,
    PrefetchHooks Function()>;
typedef $$HadithTableCreateCompanionBuilder = HadithCompanion Function({
  Value<int> id,
  required int book_id,
  required String book_name,
  required int chapter_id,
  Value<int?> section_id,
  required String hadith_key,
  required int hadith_id,
  Value<String?> narrator,
  Value<String?> bn,
  Value<String?> ar,
  Value<String?> ar_diacless,
  Value<String?> note,
  Value<int?> grade_id,
  Value<String?> grade,
  Value<String?> grade_color,
});
typedef $$HadithTableUpdateCompanionBuilder = HadithCompanion Function({
  Value<int> id,
  Value<int> book_id,
  Value<String> book_name,
  Value<int> chapter_id,
  Value<int?> section_id,
  Value<String> hadith_key,
  Value<int> hadith_id,
  Value<String?> narrator,
  Value<String?> bn,
  Value<String?> ar,
  Value<String?> ar_diacless,
  Value<String?> note,
  Value<int?> grade_id,
  Value<String?> grade,
  Value<String?> grade_color,
});

class $$HadithTableFilterComposer extends Composer<_$MyDatabase, $HadithTable> {
  $$HadithTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hadith_key => $composableBuilder(
      column: $table.hadith_key, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hadith_id => $composableBuilder(
      column: $table.hadith_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get narrator => $composableBuilder(
      column: $table.narrator, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bn => $composableBuilder(
      column: $table.bn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ar => $composableBuilder(
      column: $table.ar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ar_diacless => $composableBuilder(
      column: $table.ar_diacless, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get grade_id => $composableBuilder(
      column: $table.grade_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get grade_color => $composableBuilder(
      column: $table.grade_color, builder: (column) => ColumnFilters(column));
}

class $$HadithTableOrderingComposer
    extends Composer<_$MyDatabase, $HadithTable> {
  $$HadithTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hadith_key => $composableBuilder(
      column: $table.hadith_key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hadith_id => $composableBuilder(
      column: $table.hadith_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get narrator => $composableBuilder(
      column: $table.narrator, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bn => $composableBuilder(
      column: $table.bn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ar => $composableBuilder(
      column: $table.ar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ar_diacless => $composableBuilder(
      column: $table.ar_diacless, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get grade_id => $composableBuilder(
      column: $table.grade_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get grade => $composableBuilder(
      column: $table.grade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get grade_color => $composableBuilder(
      column: $table.grade_color, builder: (column) => ColumnOrderings(column));
}

class $$HadithTableAnnotationComposer
    extends Composer<_$MyDatabase, $HadithTable> {
  $$HadithTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get book_id =>
      $composableBuilder(column: $table.book_id, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);

  GeneratedColumn<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => column);

  GeneratedColumn<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => column);

  GeneratedColumn<String> get hadith_key => $composableBuilder(
      column: $table.hadith_key, builder: (column) => column);

  GeneratedColumn<int> get hadith_id =>
      $composableBuilder(column: $table.hadith_id, builder: (column) => column);

  GeneratedColumn<String> get narrator =>
      $composableBuilder(column: $table.narrator, builder: (column) => column);

  GeneratedColumn<String> get bn =>
      $composableBuilder(column: $table.bn, builder: (column) => column);

  GeneratedColumn<String> get ar =>
      $composableBuilder(column: $table.ar, builder: (column) => column);

  GeneratedColumn<String> get ar_diacless => $composableBuilder(
      column: $table.ar_diacless, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get grade_id =>
      $composableBuilder(column: $table.grade_id, builder: (column) => column);

  GeneratedColumn<String> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<String> get grade_color => $composableBuilder(
      column: $table.grade_color, builder: (column) => column);
}

class $$HadithTableTableManager extends RootTableManager<
    _$MyDatabase,
    $HadithTable,
    HadithData,
    $$HadithTableFilterComposer,
    $$HadithTableOrderingComposer,
    $$HadithTableAnnotationComposer,
    $$HadithTableCreateCompanionBuilder,
    $$HadithTableUpdateCompanionBuilder,
    (HadithData, BaseReferences<_$MyDatabase, $HadithTable, HadithData>),
    HadithData,
    PrefetchHooks Function()> {
  $$HadithTableTableManager(_$MyDatabase db, $HadithTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HadithTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HadithTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HadithTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> book_id = const Value.absent(),
            Value<String> book_name = const Value.absent(),
            Value<int> chapter_id = const Value.absent(),
            Value<int?> section_id = const Value.absent(),
            Value<String> hadith_key = const Value.absent(),
            Value<int> hadith_id = const Value.absent(),
            Value<String?> narrator = const Value.absent(),
            Value<String?> bn = const Value.absent(),
            Value<String?> ar = const Value.absent(),
            Value<String?> ar_diacless = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<int?> grade_id = const Value.absent(),
            Value<String?> grade = const Value.absent(),
            Value<String?> grade_color = const Value.absent(),
          }) =>
              HadithCompanion(
            id: id,
            book_id: book_id,
            book_name: book_name,
            chapter_id: chapter_id,
            section_id: section_id,
            hadith_key: hadith_key,
            hadith_id: hadith_id,
            narrator: narrator,
            bn: bn,
            ar: ar,
            ar_diacless: ar_diacless,
            note: note,
            grade_id: grade_id,
            grade: grade,
            grade_color: grade_color,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int book_id,
            required String book_name,
            required int chapter_id,
            Value<int?> section_id = const Value.absent(),
            required String hadith_key,
            required int hadith_id,
            Value<String?> narrator = const Value.absent(),
            Value<String?> bn = const Value.absent(),
            Value<String?> ar = const Value.absent(),
            Value<String?> ar_diacless = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<int?> grade_id = const Value.absent(),
            Value<String?> grade = const Value.absent(),
            Value<String?> grade_color = const Value.absent(),
          }) =>
              HadithCompanion.insert(
            id: id,
            book_id: book_id,
            book_name: book_name,
            chapter_id: chapter_id,
            section_id: section_id,
            hadith_key: hadith_key,
            hadith_id: hadith_id,
            narrator: narrator,
            bn: bn,
            ar: ar,
            ar_diacless: ar_diacless,
            note: note,
            grade_id: grade_id,
            grade: grade,
            grade_color: grade_color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HadithTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $HadithTable,
    HadithData,
    $$HadithTableFilterComposer,
    $$HadithTableOrderingComposer,
    $$HadithTableAnnotationComposer,
    $$HadithTableCreateCompanionBuilder,
    $$HadithTableUpdateCompanionBuilder,
    (HadithData, BaseReferences<_$MyDatabase, $HadithTable, HadithData>),
    HadithData,
    PrefetchHooks Function()>;
typedef $$SectionTableCreateCompanionBuilder = SectionCompanion Function({
  Value<int> id,
  required int book_id,
  required String book_name,
  required int chapter_id,
  required int section_id,
  required String title,
  Value<String?> preface,
  Value<int?> number,
  Value<int?> sort_order,
});
typedef $$SectionTableUpdateCompanionBuilder = SectionCompanion Function({
  Value<int> id,
  Value<int> book_id,
  Value<String> book_name,
  Value<int> chapter_id,
  Value<int> section_id,
  Value<String> title,
  Value<String?> preface,
  Value<int?> number,
  Value<int?> sort_order,
});

class $$SectionTableFilterComposer
    extends Composer<_$MyDatabase, $SectionTable> {
  $$SectionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preface => $composableBuilder(
      column: $table.preface, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sort_order => $composableBuilder(
      column: $table.sort_order, builder: (column) => ColumnFilters(column));
}

class $$SectionTableOrderingComposer
    extends Composer<_$MyDatabase, $SectionTable> {
  $$SectionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get book_id => $composableBuilder(
      column: $table.book_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get book_name => $composableBuilder(
      column: $table.book_name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preface => $composableBuilder(
      column: $table.preface, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sort_order => $composableBuilder(
      column: $table.sort_order, builder: (column) => ColumnOrderings(column));
}

class $$SectionTableAnnotationComposer
    extends Composer<_$MyDatabase, $SectionTable> {
  $$SectionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get book_id =>
      $composableBuilder(column: $table.book_id, builder: (column) => column);

  GeneratedColumn<String> get book_name =>
      $composableBuilder(column: $table.book_name, builder: (column) => column);

  GeneratedColumn<int> get chapter_id => $composableBuilder(
      column: $table.chapter_id, builder: (column) => column);

  GeneratedColumn<int> get section_id => $composableBuilder(
      column: $table.section_id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get preface =>
      $composableBuilder(column: $table.preface, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<int> get sort_order => $composableBuilder(
      column: $table.sort_order, builder: (column) => column);
}

class $$SectionTableTableManager extends RootTableManager<
    _$MyDatabase,
    $SectionTable,
    SectionData,
    $$SectionTableFilterComposer,
    $$SectionTableOrderingComposer,
    $$SectionTableAnnotationComposer,
    $$SectionTableCreateCompanionBuilder,
    $$SectionTableUpdateCompanionBuilder,
    (SectionData, BaseReferences<_$MyDatabase, $SectionTable, SectionData>),
    SectionData,
    PrefetchHooks Function()> {
  $$SectionTableTableManager(_$MyDatabase db, $SectionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> book_id = const Value.absent(),
            Value<String> book_name = const Value.absent(),
            Value<int> chapter_id = const Value.absent(),
            Value<int> section_id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> preface = const Value.absent(),
            Value<int?> number = const Value.absent(),
            Value<int?> sort_order = const Value.absent(),
          }) =>
              SectionCompanion(
            id: id,
            book_id: book_id,
            book_name: book_name,
            chapter_id: chapter_id,
            section_id: section_id,
            title: title,
            preface: preface,
            number: number,
            sort_order: sort_order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int book_id,
            required String book_name,
            required int chapter_id,
            required int section_id,
            required String title,
            Value<String?> preface = const Value.absent(),
            Value<int?> number = const Value.absent(),
            Value<int?> sort_order = const Value.absent(),
          }) =>
              SectionCompanion.insert(
            id: id,
            book_id: book_id,
            book_name: book_name,
            chapter_id: chapter_id,
            section_id: section_id,
            title: title,
            preface: preface,
            number: number,
            sort_order: sort_order,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SectionTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $SectionTable,
    SectionData,
    $$SectionTableFilterComposer,
    $$SectionTableOrderingComposer,
    $$SectionTableAnnotationComposer,
    $$SectionTableCreateCompanionBuilder,
    $$SectionTableUpdateCompanionBuilder,
    (SectionData, BaseReferences<_$MyDatabase, $SectionTable, SectionData>),
    SectionData,
    PrefetchHooks Function()>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$ChapterTableTableManager get chapter =>
      $$ChapterTableTableManager(_db, _db.chapter);
  $$HadithTableTableManager get hadith =>
      $$HadithTableTableManager(_db, _db.hadith);
  $$SectionTableTableManager get section =>
      $$SectionTableTableManager(_db, _db.section);
}
