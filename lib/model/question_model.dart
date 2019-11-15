import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question_model.g.dart';
abstract class QuestionModel implements Built<QuestionModel, QuestionModelBuilder>{
  @nullable
  int get id;

  @nullable
  String get question_body;

  @nullable
  int get questionnaire_id;

  @nullable
  int get user_id;


  QuestionModel._();

  factory QuestionModel([updates(QuestionModelBuilder b)])=_$QuestionModel;

  static Serializer<QuestionModel> get serializer => _$questionModelSerializer;
}
