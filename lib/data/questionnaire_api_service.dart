import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:async';
import 'package:referease/data/server_settings.dart';
import 'package:referease/model/questionnaire.dart';
import 'package:referease/data/built_value_converter.dart';
import 'built_value_converter.dart';

part 'questionnaire_api_service.chopper.dart';


@ChopperApi(baseUrl: "/questionnaires")
abstract class QuestionnairesApiService extends ChopperService {
  @Get(headers:{'Content-Type':'application/json'})
  Future<Response<BuiltList<Questionnaire>>> getQuestionnaires();

  //This will be beneficial when we implement favorites questionnaires
  @Get(headers:{'Content-Type':'application/json'}, path: '/{id}')
  Future<Response> getQuestionnaire(@Path('id') int id);

  static QuestionnairesApiService create(){
  final client =ChopperClient(baseUrl: serverBaseUrl,
  services:[
      _$QuestionnairesApiService(),
  ],
  converter: BuiltValueConverter(),
  interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
       // CurlInterceptor(), MobileDataInterceptor(),
      ],
  );
  return _$QuestionnairesApiService(client);
}
  
}