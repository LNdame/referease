import 'package:chopper/chopper.dart';
import 'package:referease/model/user_model.dart';
import 'dart:async';
import 'built_value_converter.dart';
import 'server_settings.dart';

part 'profile_api_service.chopper.dart';

@ChopperApi(baseUrl: "/user_profile")
abstract class ProfileApiService extends ChopperService {
  @Put(headers: {'Content-Type':'application/json'})
  Future<Response<UserModel>>profileRequest(@Header('Authorization') String bearer, @Body() UserModel body);

  @Get()
  Future<Response<UserModel>> profileDetailsRequest(
      @Header('Authorization') String bearer);

  static ProfileApiService create() {
    final client = ChopperClient(baseUrl: serverBaseUrl,
    services: [
     _$ProfileApiService(),
    ],
    converter: BuiltValueConverter(),
    interceptors: 
    [
       HttpLoggingInterceptor(),
    ]
    );
    return _$ProfileApiService(client);
  }
}