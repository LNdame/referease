// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Questionnaire> _$questionnaireSerializer =
    new _$QuestionnaireSerializer();

class _$QuestionnaireSerializer implements StructuredSerializer<Questionnaire> {
  @override
  final Iterable<Type> types = const [Questionnaire, _$Questionnaire];
  @override
  final String wireName = 'Questionnaire';

  @override
  Iterable<Object> serialize(Serializers serializers, Questionnaire object,
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
    if (object.questionnaire_type_id != null) {
      result
        ..add('questionnaire_type_id')
        ..add(serializers.serialize(object.questionnaire_type_id,
            specifiedType: const FullType(int)));
    }
    if (object.user_id != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.user_id,
            specifiedType: const FullType(int)));
    }
    if (object.questions != null) {
      result
        ..add('questions')
        ..add(serializers.serialize(object.questions,
            specifiedType: const FullType(
                BuiltList, const [const FullType(QuestionModel)])));
    }
    return result;
  }

  @override
  Questionnaire deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionnaireBuilder();

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
        case 'questionnaire_type_id':
          result.questionnaire_type_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(QuestionModel)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Questionnaire extends Questionnaire {
  @override
  final int id;
  @override
  final String authors;
  @override
  final String title;
  @override
  final String description;
  @override
  final int questionnaire_type_id;
  @override
  final int user_id;
  @override
  final BuiltList<QuestionModel> questions;

  factory _$Questionnaire([void Function(QuestionnaireBuilder) updates]) =>
      (new QuestionnaireBuilder()..update(updates)).build();

  _$Questionnaire._(
      {this.id,
      this.authors,
      this.title,
      this.description,
      this.questionnaire_type_id,
      this.user_id,
      this.questions})
      : super._();

  @override
  Questionnaire rebuild(void Function(QuestionnaireBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionnaireBuilder toBuilder() => new QuestionnaireBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Questionnaire &&
        id == other.id &&
        authors == other.authors &&
        title == other.title &&
        description == other.description &&
        questionnaire_type_id == other.questionnaire_type_id &&
        user_id == other.user_id &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), authors.hashCode),
                        title.hashCode),
                    description.hashCode),
                questionnaire_type_id.hashCode),
            user_id.hashCode),
        questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Questionnaire')
          ..add('id', id)
          ..add('authors', authors)
          ..add('title', title)
          ..add('description', description)
          ..add('questionnaire_type_id', questionnaire_type_id)
          ..add('user_id', user_id)
          ..add('questions', questions))
        .toString();
  }
}

class QuestionnaireBuilder
    implements Builder<Questionnaire, QuestionnaireBuilder> {
  _$Questionnaire _$v;

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

  int _questionnaire_type_id;
  int get questionnaire_type_id => _$this._questionnaire_type_id;
  set questionnaire_type_id(int questionnaire_type_id) =>
      _$this._questionnaire_type_id = questionnaire_type_id;

  int _user_id;
  int get user_id => _$this._user_id;
  set user_id(int user_id) => _$this._user_id = user_id;

  ListBuilder<QuestionModel> _questions;
  ListBuilder<QuestionModel> get questions =>
      _$this._questions ??= new ListBuilder<QuestionModel>();
  set questions(ListBuilder<QuestionModel> questions) =>
      _$this._questions = questions;

  QuestionnaireBuilder();

  QuestionnaireBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _authors = _$v.authors;
      _title = _$v.title;
      _description = _$v.description;
      _questionnaire_type_id = _$v.questionnaire_type_id;
      _user_id = _$v.user_id;
      _questions = _$v.questions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Questionnaire other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Questionnaire;
  }

  @override
  void update(void Function(QuestionnaireBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Questionnaire build() {
    _$Questionnaire _$result;
    try {
      _$result = _$v ??
          new _$Questionnaire._(
              id: id,
              authors: authors,
              title: title,
              description: description,
              questionnaire_type_id: questionnaire_type_id,
              user_id: user_id,
              questions: _questions?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        _questions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Questionnaire', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
