import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder>{
  @nullable
  int get id;

  @nullable
  String get last_name;

   @nullable
  String get first_name;

  @nullable
  String get level_of_study;

  @nullable
  String get institution;

  @nullable 
  String get faculty;

  UserModel._();

  factory UserModel([updates(UserModelBuilder b)])=_$UserModel;

  static Serializer<UserModel> get serializer => _$userModelSerializer;
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