import 'package:chopper/chopper.dart';

import 'dart:async';

import 'package:referease/data/base_api_service.dart';

part 'login_api_service.chopper.dart';

@ChopperApi(baseUrl: "/login")
abstract class LoginApiService extends ChopperService{


@Post(headers:{'Content-Type':'application/json'})
Future<Response>loginRequest(@Body() Map<String, dynamic>body);

static LoginApiService create(){ // TODO make this in parent class
  final client =ChopperClient(baseUrl: "https://referease-api.herokuapp.com",  // TODO add this to a setting file in parent class
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
