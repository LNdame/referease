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
