import 'package:chopper/chopper.dart';

import 'dart:async';
import 'package:referease/data/server_settings.dart';

part 'login_api_service.chopper.dart';

@ChopperApi(baseUrl: "/login")
abstract class LoginApiService extends ChopperService{


@Post(headers:{'Content-Type':'application/json'})
Future<Response>loginRequest(@Body() Map<String, dynamic>body);

static LoginApiService create(){
  final client =ChopperClient(baseUrl: serverBaseUrl,
  services:[
      _$LoginApiService(),
  ],
  converter: JsonConverter(),
  interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
       // CurlInterceptor(), MobileDataInterceptor(),
      ],
  );
  return _$LoginApiService(client);
}

}
