import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'source_type.dart';
import 'questionnaire.dart';

part 'serializers.g.dart';

@SerializersFor(const [Questionnaire, SourceType])
  final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();