import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';

import 'dart:async';
import 'package:referease/data/built_value_converter.dart';
import 'package:referease/model/answer_model.dart';

import 'server_settings.dart';

part 'answer_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class AnswerApiService extends ChopperService{
  @Get(path: 'answers/{id}')
  Future<Response<BuiltList<AnswerModel>>> getAnswers(
      @Header('Authorization') String bearer, @Path('id') int id);

  @Get(path: 'answer/{id}')
  Future<Response<AnswerModel>> getAnswer(
      @Header('Authorization') String bearer, @Path('id') int id);

  @Post(path: 'answer/0', headers: {'Content-Type': 'application/json'})
  Future<Response<AnswerModel>> addAnswer(
      @Header('Authorization') String bearer, @Body() AnswerModel body);

  @Put(path: 'answer/{id}', headers: {'Content-Type': 'application/json'})
  Future<Response<AnswerModel>> updateAnswer(
      @Header('Authorization') String bearer,
      @Body() AnswerModel body,
      @Path('id') int id);

  @Delete(path: 'answer/{id}', headers: {'Content-Type': 'application/json'})
  Future<Response> deleteAnswer(
      @Header('Authorization') String bearer, @Path('id') int id);



  static AnswerApiService create() {
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$AnswerApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$AnswerApiService(client);
  }
}