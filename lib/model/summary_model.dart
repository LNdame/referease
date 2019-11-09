import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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
  int get questionnaire_id;

  SummaryModel._();

  factory SummaryModel([updates(SummaryModelBuilder b)])=_$SummaryModel;

  static Serializer<SummaryModel> get serializer => _$summaryModelSerializer;

}