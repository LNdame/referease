// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SourceType> _$sourceTypeSerializer = new _$SourceTypeSerializer();

class _$SourceTypeSerializer implements StructuredSerializer<SourceType> {
  @override
  final Iterable<Type> types = const [SourceType, _$SourceType];
  @override
  final String wireName = 'SourceType';

  @override
  Iterable<Object> serialize(Serializers serializers, SourceType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SourceType deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SourceTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SourceType extends SourceType {
  @override
  final String name;
  @override
  final String description;

  factory _$SourceType([void Function(SourceTypeBuilder) updates]) =>
      (new SourceTypeBuilder()..update(updates)).build();

  _$SourceType._({this.name, this.description}) : super._();

  @override
  SourceType rebuild(void Function(SourceTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceTypeBuilder toBuilder() => new SourceTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SourceType &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SourceType')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class SourceTypeBuilder implements Builder<SourceType, SourceTypeBuilder> {
  _$SourceType _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  SourceTypeBuilder();

  SourceTypeBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SourceType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SourceType;
  }

  @override
  void update(void Function(SourceTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SourceType build() {
    final _$result =
        _$v ?? new _$SourceType._(name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
