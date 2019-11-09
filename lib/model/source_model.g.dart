// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SourceModel> _$sourceModelSerializer = new _$SourceModelSerializer();

class _$SourceModelSerializer implements StructuredSerializer<SourceModel> {
  @override
  final Iterable<Type> types = const [SourceModel, _$SourceModel];
  @override
  final String wireName = 'SourceModel';

  @override
  Iterable<Object> serialize(Serializers serializers, SourceModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.authors != null) {
      result
        ..add('authors')
        ..add(serializers.serialize(object.authors,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.proceeding_title != null) {
      result
        ..add('proceeding_title')
        ..add(serializers.serialize(object.proceeding_title,
            specifiedType: const FullType(String)));
    }
    if (object.journal != null) {
      result
        ..add('journal')
        ..add(serializers.serialize(object.journal,
            specifiedType: const FullType(String)));
    }
    if (object.doi != null) {
      result
        ..add('doi')
        ..add(serializers.serialize(object.doi,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.date_accessed != null) {
      result
        ..add('date_accessed')
        ..add(serializers.serialize(object.date_accessed,
            specifiedType: const FullType(String)));
    }
    if (object.volume != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(object.volume,
            specifiedType: const FullType(String)));
    }
    if (object.issue != null) {
      result
        ..add('issue')
        ..add(serializers.serialize(object.issue,
            specifiedType: const FullType(String)));
    }
    if (object.edition != null) {
      result
        ..add('edition')
        ..add(serializers.serialize(object.edition,
            specifiedType: const FullType(String)));
    }
    if (object.editors != null) {
      result
        ..add('editors')
        ..add(serializers.serialize(object.editors,
            specifiedType: const FullType(String)));
    }
    if (object.isbn != null) {
      result
        ..add('isbn')
        ..add(serializers.serialize(object.isbn,
            specifiedType: const FullType(String)));
    }
    if (object.publisher != null) {
      result
        ..add('publisher')
        ..add(serializers.serialize(object.publisher,
            specifiedType: const FullType(String)));
    }
    if (object.publication != null) {
      result
        ..add('publication')
        ..add(serializers.serialize(object.publication,
            specifiedType: const FullType(String)));
    }
    if (object.year != null) {
      result
        ..add('year')
        ..add(serializers.serialize(object.year,
            specifiedType: const FullType(String)));
    }
    if (object.pages != null) {
      result
        ..add('pages')
        ..add(serializers.serialize(object.pages,
            specifiedType: const FullType(String)));
    }
    if (object.source_type_id != null) {
      result
        ..add('source_type_id')
        ..add(serializers.serialize(object.source_type_id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  SourceModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SourceModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'authors':
          result.authors = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'proceeding_title':
          result.proceeding_title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'journal':
          result.journal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'doi':
          result.doi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_accessed':
          result.date_accessed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'issue':
          result.issue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'edition':
          result.edition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'editors':
          result.editors = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isbn':
          result.isbn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publisher':
          result.publisher = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publication':
          result.publication = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pages':
          result.pages = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source_type_id':
          result.source_type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SourceModel extends SourceModel {
  @override
  final int id;
  @override
  final String authors;
  @override
  final String city;
  @override
  final String title;
  @override
  final String proceeding_title;
  @override
  final String journal;
  @override
  final String doi;
  @override
  final String url;
  @override
  final String date_accessed;
  @override
  final String volume;
  @override
  final String issue;
  @override
  final String edition;
  @override
  final String editors;
  @override
  final String isbn;
  @override
  final String publisher;
  @override
  final String publication;
  @override
  final String year;
  @override
  final String pages;
  @override
  final int source_type_id;

  factory _$SourceModel([void Function(SourceModelBuilder) updates]) =>
      (new SourceModelBuilder()..update(updates)).build();

  _$SourceModel._(
      {this.id,
      this.authors,
      this.city,
      this.title,
      this.proceeding_title,
      this.journal,
      this.doi,
      this.url,
      this.date_accessed,
      this.volume,
      this.issue,
      this.edition,
      this.editors,
      this.isbn,
      this.publisher,
      this.publication,
      this.year,
      this.pages,
      this.source_type_id})
      : super._();

  @override
  SourceModel rebuild(void Function(SourceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceModelBuilder toBuilder() => new SourceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceModel &&
        id == other.id &&
        authors == other.authors &&
        city == other.city &&
        title == other.title &&
        proceeding_title == other.proceeding_title &&
        journal == other.journal &&
        doi == other.doi &&
        url == other.url &&
        date_accessed == other.date_accessed &&
        volume == other.volume &&
        issue == other.issue &&
        edition == other.edition &&
        editors == other.editors &&
        isbn == other.isbn &&
        publisher == other.publisher &&
        publication == other.publication &&
        year == other.year &&
        pages == other.pages &&
        source_type_id == other.source_type_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                id
                                                                                    .hashCode),
                                                                            authors
                                                                                .hashCode),
                                                                        city
                                                                            .hashCode),
                                                                    title
                                                                        .hashCode),
                                                                proceeding_title
                                                                    .hashCode),
                                                            journal.hashCode),
                                                        doi.hashCode),
                                                    url.hashCode),
                                                date_accessed.hashCode),
                                            volume.hashCode),
                                        issue.hashCode),
                                    edition.hashCode),
                                editors.hashCode),
                            isbn.hashCode),
                        publisher.hashCode),
                    publication.hashCode),
                year.hashCode),
            pages.hashCode),
        source_type_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SourceModel')
          ..add('id', id)
          ..add('authors', authors)
          ..add('city', city)
          ..add('title', title)
          ..add('proceeding_title', proceeding_title)
          ..add('journal', journal)
          ..add('doi', doi)
          ..add('url', url)
          ..add('date_accessed', date_accessed)
          ..add('volume', volume)
          ..add('issue', issue)
          ..add('edition', edition)
          ..add('editors', editors)
          ..add('isbn', isbn)
          ..add('publisher', publisher)
          ..add('publication', publication)
          ..add('year', year)
          ..add('pages', pages)
          ..add('source_type_id', source_type_id))
        .toString();
  }
}

class SourceModelBuilder implements Builder<SourceModel, SourceModelBuilder> {
  _$SourceModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _authors;
  String get authors => _$this._authors;
  set authors(String authors) => _$this._authors = authors;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _proceeding_title;
  String get proceeding_title => _$this._proceeding_title;
  set proceeding_title(String proceeding_title) =>
      _$this._proceeding_title = proceeding_title;

  String _journal;
  String get journal => _$this._journal;
  set journal(String journal) => _$this._journal = journal;

  String _doi;
  String get doi => _$this._doi;
  set doi(String doi) => _$this._doi = doi;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _date_accessed;
  String get date_accessed => _$this._date_accessed;
  set date_accessed(String date_accessed) =>
      _$this._date_accessed = date_accessed;

  String _volume;
  String get volume => _$this._volume;
  set volume(String volume) => _$this._volume = volume;

  String _issue;
  String get issue => _$this._issue;
  set issue(String issue) => _$this._issue = issue;

  String _edition;
  String get edition => _$this._edition;
  set edition(String edition) => _$this._edition = edition;

  String _editors;
  String get editors => _$this._editors;
  set editors(String editors) => _$this._editors = editors;

  String _isbn;
  String get isbn => _$this._isbn;
  set isbn(String isbn) => _$this._isbn = isbn;

  String _publisher;
  String get publisher => _$this._publisher;
  set publisher(String publisher) => _$this._publisher = publisher;

  String _publication;
  String get publication => _$this._publication;
  set publication(String publication) => _$this._publication = publication;

  String _year;
  String get year => _$this._year;
  set year(String year) => _$this._year = year;

  String _pages;
  String get pages => _$this._pages;
  set pages(String pages) => _$this._pages = pages;

  int _source_type_id;
  int get source_type_id => _$this._source_type_id;
  set source_type_id(int source_type_id) =>
      _$this._source_type_id = source_type_id;

  SourceModelBuilder();

  SourceModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _authors = _$v.authors;
      _city = _$v.city;
      _title = _$v.title;
      _proceeding_title = _$v.proceeding_title;
      _journal = _$v.journal;
      _doi = _$v.doi;
      _url = _$v.url;
      _date_accessed = _$v.date_accessed;
      _volume = _$v.volume;
      _issue = _$v.issue;
      _edition = _$v.edition;
      _editors = _$v.editors;
      _isbn = _$v.isbn;
      _publisher = _$v.publisher;
      _publication = _$v.publication;
      _year = _$v.year;
      _pages = _$v.pages;
      _source_type_id = _$v.source_type_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SourceModel;
  }

  @override
  void update(void Function(SourceModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SourceModel build() {
    final _$result = _$v ??
        new _$SourceModel._(
            id: id,
            authors: authors,
            city: city,
            title: title,
            proceeding_title: proceeding_title,
            journal: journal,
            doi: doi,
            url: url,
            date_accessed: date_accessed,
            volume: volume,
            issue: issue,
            edition: edition,
            editors: editors,
            isbn: isbn,
            publisher: publisher,
            publication: publication,
            year: year,
            pages: pages,
            source_type_id: source_type_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
