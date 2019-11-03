import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';

import 'dart:async';
import 'package:referease/data/built_value_converter.dart';
import 'package:referease/model/summary_model.dart';

import 'server_settings.dart';

part 'summary_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class SummaryApiService extends ChopperService {
  @Get(path: 'reading_summaries')
  Future<Response<BuiltList<SummaryModel>>> getSummaries(
      @Header('Authorization') String bearer);

  @Get(path: 'reading_summary/{id}')
  Future<Response<SummaryModel>> getSummary(
      @Header('Authorization') String bearer, @Path('id') int id);

  @Post(path: 'reading_summary/0', headers: {'Content-Type': 'application/json'})
  Future<Response<SummaryModel>> addSummary(
      @Header('Authorization') String bearer, @Body() SummaryModel body);

  @Put(path: 'reading_summary/{id}', headers: {'Content-Type': 'application/json'})
  Future<Response<SummaryModel>> updateSummary(
      @Header('Authorization') String bearer,
      @Body() SummaryModel body,
      @Path('id') int id);

  @Delete(path: 'reading_summary/{id}', headers: {'Content-Type': 'application/json'})
  Future<Response> deleteSummary(
      @Header('Authorization') String bearer, @Path('id') int id);

  static SummaryApiService create() {
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$SummaryApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$SummaryApiService(client);
  }
}
