import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'source_model.g.dart';
abstract class SourceModel implements Built<SourceModel, SourceModelBuilder>{
  @nullable
  int get id;

  @nullable
  String get authors;

  @nullable
  String get city;

  @nullable
  String get title;

  @nullable
  String get proceeding_title;

  @nullable
  String get journal;

  @nullable
  String get doi;

  @nullable
  String get url;

  @nullable
  String get date_accessed;

  @nullable
  String get volume;

  @nullable
  String get issue;

  @nullable
  String get edition;

  @nullable
  String get editors;

  @nullable
  String get isbn;

  @nullable
  String get publisher;

  @nullable
  String get publication;

  @nullable
  String get year;

  @nullable
  String get pages;

  @nullable
  int get source_type_id;

  SourceModel._();

  factory SourceModel([updates(SourceModelBuilder b)])=_$SourceModel;

  static Serializer<SourceModel> get serializer => _$sourceModelSerializer;
}




/*
"authors": "author one, author two",
"city": "city",
"title": "a title",
"proceeding_title": "proceeding_title",
"journal": "journal",
"doi": "doi",
"url": "www.url.com",
"date_accessed": "19/10/2019",
"volume": "a volume",
"issue": "an issue",
"edition": "an edition",
"editors": "editors",
"isbn": "9999999999999999",
"publisher": "a publisher",
"year": "2019",
"pages": "99",
"source_type_id": 1 */