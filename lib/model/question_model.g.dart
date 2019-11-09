// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionModel> _$questionModelSerializer =
    new _$QuestionModelSerializer();

class _$QuestionModelSerializer implements StructuredSerializer<QuestionModel> {
  @override
  final Iterable<Type> types = const [QuestionModel, _$QuestionModel];
  @override
  final String wireName = 'QuestionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, QuestionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.question_body != null) {
      result
        ..add('question_body')
        ..add(serializers.serialize(object.question_body,
            specifiedType: const FullType(String)));
    }
    if (object.questionnaire_id != null) {
      result
        ..add('questionnaire_id')
        ..add(serializers.serialize(object.questionnaire_id,
            specifiedType: const FullType(int)));
    }
    if (object.user_id != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.user_id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  QuestionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionModelBuilder();

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
        case 'question_body':
          result.question_body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'questionnaire_id':
          result.questionnaire_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionModel extends QuestionModel {
  @override
  final int id;
  @override
  final String question_body;
  @override
  final int questionnaire_id;
  @override
  final int user_id;

  factory _$QuestionModel([void Function(QuestionModelBuilder) updates]) =>
      (new QuestionModelBuilder()..update(updates)).build();

  _$QuestionModel._(
      {this.id, this.question_body, this.questionnaire_id, this.user_id})
      : super._();

  @override
  QuestionModel rebuild(void Function(QuestionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionModelBuilder toBuilder() => new QuestionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionModel &&
        id == other.id &&
        question_body == other.question_body &&
        questionnaire_id == other.questionnaire_id &&
        user_id == other.user_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), question_body.hashCode),
            questionnaire_id.hashCode),
        user_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionModel')
          ..add('id', id)
          ..add('question_body', question_body)
          ..add('questionnaire_id', questionnaire_id)
          ..add('user_id', user_id))
        .toString();
  }
}

class QuestionModelBuilder
    implements Builder<QuestionModel, QuestionModelBuilder> {
  _$QuestionModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _question_body;
  String get question_body => _$this._question_body;
  set question_body(String question_body) =>
      _$this._question_body = question_body;

  int _questionnaire_id;
  int get questionnaire_id => _$this._questionnaire_id;
  set questionnaire_id(int questionnaire_id) =>
      _$this._questionnaire_id = questionnaire_id;

  int _user_id;
  int get user_id => _$this._user_id;
  set user_id(int user_id) => _$this._user_id = user_id;

  QuestionModelBuilder();

  QuestionModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _question_body = _$v.question_body;
      _questionnaire_id = _$v.questionnaire_id;
      _user_id = _$v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$QuestionModel;
  }

  @override
  void update(void Function(QuestionModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionModel build() {
    final _$result = _$v ??
        new _$QuestionModel._(
            id: id,
            question_body: question_body,
            questionnaire_id: questionnaire_id,
            user_id: user_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
