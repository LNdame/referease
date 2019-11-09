// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RefreshApiService extends RefreshApiService {
  _$RefreshApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RefreshApiService;

  Future<Response> getRefreshToken(String bearer) {
    final $url = '/refresh';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
