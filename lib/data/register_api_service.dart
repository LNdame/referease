import 'package:chopper/chopper.dart';
import 'dart:async';

part 'register_api_service.chopper.dart';

@ChopperApi(baseUrl: "/register")
abstract class RegisterApiService extends ChopperService{

  @Post(headers:{'Content-Type':'application/json'})
  Future<Response>registerRequest(@Body() Map<String, dynamic>body);

  static RegisterApiService create(){ // TODO make this in parent class
    final client =ChopperClient(baseUrl: "https://referease-api.herokuapp.com",  // TODO add this to a setting file in parent class
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