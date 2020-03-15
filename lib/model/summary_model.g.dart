// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummaryModel> _$summaryModelSerializer =
    new _$SummaryModelSerializer();

class _$SummaryModelSerializer implements StructuredSerializer<SummaryModel> {
  @override
  final Iterable<Type> types = const [SummaryModel, _$SummaryModel];
  @override
  final String wireName = 'SummaryModel';

  @override
  Iterable<Object> serialize(Serializers serializers, SummaryModel object,
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
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.summary_type != null) {
      result
        ..add('summary_type')
        ..add(serializers.serialize(object.summary_type,
            specifiedType: const FullType(String)));
    }
    if (object.year != null) {
      result
        ..add('year')
        ..add(serializers.serialize(object.year,
            specifiedType: const FullType(String)));
    }
    if (object.created_date != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(object.created_date,
            specifiedType: const FullType(String)));
    }
    if (object.questionnaire_id != null) {
      result
        ..add('questionnaire_id')
        ..add(serializers.serialize(object.questionnaire_id,
            specifiedType: const FullType(int)));
    }
    if (object.answers != null) {
      result
        ..add('answers')
        ..add(serializers.serialize(object.answers,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AnswerModel)])));
    }
    return result;
  }

  @override
  SummaryModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummaryModelBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'summary_type':
          result.summary_type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_date':
          result.created_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'questionnaire_id':
          result.questionnaire_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'answers':
          result.answers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnswerModel)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$SummaryModel extends SummaryModel {
  @override
  final int id;
  @override
  final String authors;
  @override
  final String title;
  @override
  final String description;
  @override
  final String summary_type;
  @override
  final String year;
  @override
  final String created_date;
  @override
  final int questionnaire_id;
  @override
  final BuiltList<AnswerModel> answers;

  factory _$SummaryModel([void Function(SummaryModelBuilder) updates]) =>
      (new SummaryModelBuilder()..update(updates)).build();

  _$SummaryModel._(
      {this.id,
      this.authors,
      this.title,
      this.description,
      this.summary_type,
      this.year,
      this.created_date,
      this.questionnaire_id,
      this.answers})
      : super._();

  @override
  SummaryModel rebuild(void Function(SummaryModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummaryModelBuilder toBuilder() => new SummaryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummaryModel &&
        id == other.id &&
        authors == other.authors &&
        title == other.title &&
        description == other.description &&
        summary_type == other.summary_type &&
        year == other.year &&
        created_date == other.created_date &&
        questionnaire_id == other.questionnaire_id &&
        answers == other.answers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), authors.hashCode),
                                title.hashCode),
                            description.hashCode),
                        summary_type.hashCode),
                    year.hashCode),
                created_date.hashCode),
            questionnaire_id.hashCode),
        answers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SummaryModel')
          ..add('id', id)
          ..add('authors', authors)
          ..add('title', title)
          ..add('description', description)
          ..add('summary_type', summary_type)
          ..add('year', year)
          ..add('created_date', created_date)
          ..add('questionnaire_id', questionnaire_id)
          ..add('answers', answers))
        .toString();
  }
}

class SummaryModelBuilder
    implements Builder<SummaryModel, SummaryModelBuilder> {
  _$SummaryModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _authors;
  String get authors => _$this._authors;
  set authors(String authors) => _$this._authors = authors;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _summary_type;
  String get summary_type => _$this._summary_type;
  set summary_type(String summary_type) => _$this._summary_type = summary_type;

  String _year;
  String get year => _$this._year;
  set year(String year) => _$this._year = year;

  String _created_date;
  String get created_date => _$this._created_date;
  set created_date(String created_date) => _$this._created_date = created_date;

  int _questionnaire_id;
  int get questionnaire_id => _$this._questionnaire_id;
  set questionnaire_id(int questionnaire_id) =>
      _$this._questionnaire_id = questionnaire_id;

  ListBuilder<AnswerModel> _answers;
  ListBuilder<AnswerModel> get answers =>
      _$this._answers ??= new ListBuilder<AnswerModel>();
  set answers(ListBuilder<AnswerModel> answers) => _$this._answers = answers;

  SummaryModelBuilder();

  SummaryModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _authors = _$v.authors;
      _title = _$v.title;
      _description = _$v.description;
      _summary_type = _$v.summary_type;
      _year = _$v.year;
      _created_date = _$v.created_date;
      _questionnaire_id = _$v.questionnaire_id;
      _answers = _$v.answers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummaryModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SummaryModel;
  }

  @override
  void update(void Function(SummaryModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SummaryModel build() {
    _$SummaryModel _$result;
    try {
      _$result = _$v ??
          new _$SummaryModel._(
              id: id,
              authors: authors,
              title: title,
              description: description,
              summary_type: summary_type,
              year: year,
              created_date: created_date,
              questionnaire_id: questionnaire_id,
              answers: _answers?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'answers';
        _answers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SummaryModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
