import 'package:chopper/chopper.dart';
import 'dart:async';

part 'base_api_service.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class BaseApiService extends ChopperService{


  static BaseApiService create(){ // TODO make this in parent class
    final client =ChopperClient(baseUrl: "https://referease-api.herokuapp.com",  // TODO add this to a setting file in parent class
      services:[
        _$BaseApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
        // CurlInterceptor(), MobileDataInterceptor(),
      ],
    );
    return _$BaseApiService(client);
  }
}