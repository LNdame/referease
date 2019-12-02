import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:referease/model/source_model.dart';
import 'package:referease/model/summary_model.dart';
import 'package:referease/model/user_model.dart';
import 'question_model.dart';
import 'source_type.dart';
import 'questionnaire.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Questionnaire,
  SourceType,
  SourceModel,
  SummaryModel,
  QuestionModel,
  UserModel
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
