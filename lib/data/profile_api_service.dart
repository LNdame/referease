import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as prefix0;
import 'dart:async';
import 'server_settings.dart';


part 'profile_api_service.chopper.dart';

@ChopperApi(baseUrl: "/user_profile")
abstract class ProfileApiService extends ChopperService {
  @Put(headers: {'Content-Type':'application/json'})
  Future<Response>profileRequest(@Header('Authorization') String bearer, @Body() Map<String, dynamic>body);

  @Get()
  Future<Response> profileDetailsRequest(
      @Header('Authorization') String bearer);



  static ProfileApiService create() {
    final client = ChopperClient(baseUrl: serverBaseUrl,
    services: [
     _$ProfileApiService(),
    ],
    converter: JsonConverter(),
    interceptors: [
      HeadersInterceptor({'Cache-Control':'no-cache'}),
       HttpLoggingInterceptor(),
    ]
    );
    return _$ProfileApiService(client);
  }

}