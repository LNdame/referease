// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ProfileApiService extends ProfileApiService {
  _$ProfileApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ProfileApiService;

  Future<Response<UserModel>> profileRequest(String bearer, UserModel body) {
    final $url = '/user_profile';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<UserModel, UserModel>($request);
  }

  Future<Response<UserModel>> profileDetailsRequest(String bearer) {
    final $url = '/user_profile';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserModel, UserModel>($request);
  }
}
