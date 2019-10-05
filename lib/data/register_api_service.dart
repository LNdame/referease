import 'package:chopper/chopper.dart';
import 'dart:async';

import 'server_settings.dart';

part 'register_api_service.chopper.dart';

@ChopperApi(baseUrl: "/register")
abstract class RegisterApiService extends ChopperService{

  @Post(headers:{'Content-Type':'application/json'})
  Future<Response>registerRequest(@Body() Map<String, dynamic>body);

  static RegisterApiService create(){
    final client =ChopperClient(baseUrl: serverBaseUrl,
      services:[
        _$RegisterApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
        // CurlInterceptor(), MobileDataInterceptor(),
      ],
    );
    return _$RegisterApiService(client);
  }

}