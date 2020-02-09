// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AnswerModel> _$answerModelSerializer = new _$AnswerModelSerializer();

class _$AnswerModelSerializer implements StructuredSerializer<AnswerModel> {
  @override
  final Iterable<Type> types = const [AnswerModel, _$AnswerModel];
  @override
  final String wireName = 'AnswerModel';

  @override
  Iterable<Object> serialize(Serializers serializers, AnswerModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.answer_body != null) {
      result
        ..add('answer_body')
        ..add(serializers.serialize(object.answer_body,
            specifiedType: const FullType(String)));
    }
    if (object.question_id != null) {
      result
        ..add('question_id')
        ..add(serializers.serialize(object.question_id,
            specifiedType: const FullType(int)));
    }
    if (object.questionnaire_id != null) {
      result
        ..add('questionnaire_id')
        ..add(serializers.serialize(object.questionnaire_id,
            specifiedType: const FullType(int)));
    }
    if (object.reading_summary_id != null) {
      result
        ..add('reading_summary_id')
        ..add(serializers.serialize(object.reading_summary_id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AnswerModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnswerModelBuilder();

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
        case 'answer_body':
          result.answer_body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'question_id':
          result.question_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'questionnaire_id':
          result.questionnaire_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'reading_summary_id':
          result.reading_summary_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AnswerModel extends AnswerModel {
  @override
  final int id;
  @override
  final String answer_body;
  @override
  final int question_id;
  @override
  final int questionnaire_id;
  @override
  final int reading_summary_id;

  factory _$AnswerModel([void Function(AnswerModelBuilder) updates]) =>
      (new AnswerModelBuilder()..update(updates)).build();

  _$AnswerModel._(
      {this.id,
      this.answer_body,
      this.question_id,
      this.questionnaire_id,
      this.reading_summary_id})
      : super._();

  @override
  AnswerModel rebuild(void Function(AnswerModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnswerModelBuilder toBuilder() => new AnswerModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnswerModel &&
        id == other.id &&
        answer_body == other.answer_body &&
        question_id == other.question_id &&
        questionnaire_id == other.questionnaire_id &&
        reading_summary_id == other.reading_summary_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), answer_body.hashCode),
                question_id.hashCode),
            questionnaire_id.hashCode),
        reading_summary_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnswerModel')
          ..add('id', id)
          ..add('answer_body', answer_body)
          ..add('question_id', question_id)
          ..add('questionnaire_id', questionnaire_id)
          ..add('reading_summary_id', reading_summary_id))
        .toString();
  }
}

class AnswerModelBuilder implements Builder<AnswerModel, AnswerModelBuilder> {
  _$AnswerModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _answer_body;
  String get answer_body => _$this._answer_body;
  set answer_body(String answer_body) => _$this._answer_body = answer_body;

  int _question_id;
  int get question_id => _$this._question_id;
  set question_id(int question_id) => _$this._question_id = question_id;

  int _questionnaire_id;
  int get questionnaire_id => _$this._questionnaire_id;
  set questionnaire_id(int questionnaire_id) =>
      _$this._questionnaire_id = questionnaire_id;

  int _reading_summary_id;
  int get reading_summary_id => _$this._reading_summary_id;
  set reading_summary_id(int reading_summary_id) =>
      _$this._reading_summary_id = reading_summary_id;

  AnswerModelBuilder();

  AnswerModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _answer_body = _$v.answer_body;
      _question_id = _$v.question_id;
      _questionnaire_id = _$v.questionnaire_id;
      _reading_summary_id = _$v.reading_summary_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnswerModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnswerModel;
  }

  @override
  void update(void Function(AnswerModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AnswerModel build() {
    final _$result = _$v ??
        new _$AnswerModel._(
            id: id,
            answer_body: answer_body,
            question_id: question_id,
            questionnaire_id: questionnaire_id,
            reading_summary_id: reading_summary_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
