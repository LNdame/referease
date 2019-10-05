import 'dart:convert';
import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'source_type.g.dart';

abstract class SourceType implements Built<SourceType, SourceTypeBuilder>{


 // @nullable
  //int get id;
  @nullable
  String get name;

  @nullable
  String get description;

  SourceType._();

  factory SourceType([updates(SourceTypeBuilder b)])=_$SourceType;

  static Serializer<SourceType> get serializer => _$sourceTypeSerializer;

}




/* "name": "journal",
    "description": "journal reference",
    "sources": []*/