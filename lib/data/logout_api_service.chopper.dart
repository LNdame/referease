// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$LogoutApiService extends LogoutApiService {
  _$LogoutApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = LogoutApiService;

  Future<Response> logoutRequest(String bearer) {
    final $url = '/logout';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
