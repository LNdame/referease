import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:referease/model/source_model.dart';
import 'package:referease/model/summary_model.dart';
import 'source_type.dart';
import 'questionnaire.dart';

part 'serializers.g.dart';

@SerializersFor(const [Questionnaire, SourceType, SourceModel,SummaryModel])
  final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();