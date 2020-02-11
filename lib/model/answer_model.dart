import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'answer_model.g.dart';
abstract class AnswerModel implements Built<AnswerModel, AnswerModelBuilder>{
  @nullable
  int get id;

  @nullable
  String get answer_body;

  @nullable
  int get question_id;

  @nullable
  int get questionnaire_id;

  @nullable
  int get reading_summary_id;

  AnswerModel._();

  factory AnswerModel([updates(AnswerModelBuilder b)])=_$AnswerModel;

  static Serializer<AnswerModel> get serializer=>_$answerModelSerializer;

}