// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.last_name != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(object.last_name,
            specifiedType: const FullType(String)));
    }
    if (object.first_name != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.first_name,
            specifiedType: const FullType(String)));
    }
    if (object.level_of_study != null) {
      result
        ..add('level_of_study')
        ..add(serializers.serialize(object.level_of_study,
            specifiedType: const FullType(String)));
    }
    if (object.institution != null) {
      result
        ..add('institution')
        ..add(serializers.serialize(object.institution,
            specifiedType: const FullType(String)));
    }
    if (object.faculty != null) {
      result
        ..add('faculty')
        ..add(serializers.serialize(object.faculty,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

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
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'level_of_study':
          result.level_of_study = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'institution':
          result.institution = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'faculty':
          result.faculty = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final int id;
  @override
  final String last_name;
  @override
  final String first_name;
  @override
  final String level_of_study;
  @override
  final String institution;
  @override
  final String faculty;

  factory _$UserModel([void Function(UserModelBuilder) updates]) =>
      (new UserModelBuilder()..update(updates)).build();

  _$UserModel._(
      {this.id,
      this.last_name,
      this.first_name,
      this.level_of_study,
      this.institution,
      this.faculty})
      : super._();

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        last_name == other.last_name &&
        first_name == other.first_name &&
        level_of_study == other.level_of_study &&
        institution == other.institution &&
        faculty == other.faculty;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), last_name.hashCode),
                    first_name.hashCode),
                level_of_study.hashCode),
            institution.hashCode),
        faculty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserModel')
          ..add('id', id)
          ..add('last_name', last_name)
          ..add('first_name', first_name)
          ..add('level_of_study', level_of_study)
          ..add('institution', institution)
          ..add('faculty', faculty))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _last_name;
  String get last_name => _$this._last_name;
  set last_name(String last_name) => _$this._last_name = last_name;

  String _first_name;
  String get first_name => _$this._first_name;
  set first_name(String first_name) => _$this._first_name = first_name;

  String _level_of_study;
  String get level_of_study => _$this._level_of_study;
  set level_of_study(String level_of_study) =>
      _$this._level_of_study = level_of_study;

  String _institution;
  String get institution => _$this._institution;
  set institution(String institution) => _$this._institution = institution;

  String _faculty;
  String get faculty => _$this._faculty;
  set faculty(String faculty) => _$this._faculty = faculty;

  UserModelBuilder();

  UserModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _last_name = _$v.last_name;
      _first_name = _$v.first_name;
      _level_of_study = _$v.level_of_study;
      _institution = _$v.institution;
      _faculty = _$v.faculty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserModel build() {
    final _$result = _$v ??
        new _$UserModel._(
            id: id,
            last_name: last_name,
            first_name: first_name,
            level_of_study: level_of_study,
            institution: institution,
            faculty: faculty);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
