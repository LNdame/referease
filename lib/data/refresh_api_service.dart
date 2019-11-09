import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:referease/data/built_value_converter.dart';
import 'package:referease/model/source_type.dart';
import 'dart:async';

import 'server_settings.dart';

part 'refresh_api_service.chopper.dart';

@ChopperApi(baseUrl: "/refresh")
abstract class RefreshApiService extends ChopperService{
//
  @Post(headers:{'Content-Type':'application/json'})
  Future<Response> getRefreshToken(
      @Header('Authorization') String bearer
      );

  static RefreshApiService create() {
    final client = ChopperClient(
      baseUrl:  serverBaseUrl,
      services: [
        _$RefreshApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$RefreshApiService(client);
  }
}