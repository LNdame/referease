import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'answer_model.dart';

part 'summary_model.g.dart';


abstract class  SummaryModel implements Built<SummaryModel, SummaryModelBuilder>{
  @nullable
  int get id;

  @nullable
  String get authors;

  @nullable
  String get title;

  @nullable
  String get description;

  @nullable
  String get summary_type;

  @nullable
  String get year;

  @nullable
  String get created_date;

  @nullable
  int get questionnaire_id;

  @nullable
  BuiltList<AnswerModel> get answers;

  SummaryModel._();

  factory SummaryModel([updates(SummaryModelBuilder b)])=_$SummaryModel;

  static Serializer<SummaryModel> get serializer => _$summaryModelSerializer;

}