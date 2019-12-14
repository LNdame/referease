import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:referease/data/server_settings.dart';
part 'logout_api_service.chopper.dart';

@ChopperApi(baseUrl: "/logout")
abstract class LogoutApiService extends ChopperService {
  @Post(headers: {'Content-Type': 'application/json'})
  Future<Response> logoutRequest(@Header('Authorization') String bearer);

  static LogoutApiService create() {
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$LogoutApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HttpLoggingInterceptor(),
        // CurlInterceptor(), MobileDataInterceptor(),

        (Response response) async {
          if (response.statusCode == 400 || response.statusCode == 401) {
            chopperLogger.severe("big big trouble");
          }
          return response;
        }
      ],
    );
    return _$LogoutApiService(client);
  }
}
