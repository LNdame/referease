import 'package:chopper/chopper.dart';

import 'dart:async';
import 'package:referease/data/server_settings.dart';

part 'questionnaire_api_service.chopper.dart';


@ChopperApi(baseUrl: "/questionnaire")
abstract class QuestionnairesApiService extends ChopperService {
  @Get(headers:{'Content-Type':'application/json'})
  Future<Response> getQuestionnaires();

  @Get(headers:{'Content-Type':'application/json'}, path: '/{id}')
  Future<Response> getQuestionnaire(@Path('id') int id);

  static QuestionnairesApiService create(){
  final client =ChopperClient(baseUrl: serverBaseUrl,
  services:[
      _$QuestionnairesApiService(),
  ],
  converter: JsonConverter(),
  interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
       // CurlInterceptor(), MobileDataInterceptor(),
      ],
  );
  return _$QuestionnairesApiService(client);
}
  
}