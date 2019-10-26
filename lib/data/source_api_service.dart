import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:referease/data/built_value_converter.dart';
import 'package:referease/model/source_model.dart';

import 'server_settings.dart';


part 'source_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class SourceApiService extends ChopperService{

  @Get(path:'sources')
  Future<Response<BuiltList<SourceModel>>> getSourceModel(@Header('Authorization') String bearer);

  @Get(path: 'source/{id}')
  Future<Response<SourceModel>> getSourceType(@Header('Authorization') String bearer, @Path('id') String name);

  @Post(path:'source/0',headers:{'Content-Type':'application/json'})
  Future<Response<SourceModel>> addSource(
      @Header('Authorization') String bearer ,
      @Body() SourceModel body
      );

  static SourceApiService create() {
    final client = ChopperClient(
      baseUrl:  serverBaseUrl,
      services: [
        _$SourceApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$SourceApiService(client);
  }
}

/*  @Post(headers:{'Content-Type':'application/json'})
  Future<Response> getRefreshToken(
      @Header('Authorization') String bearer
      );*/