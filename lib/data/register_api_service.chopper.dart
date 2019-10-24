// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RegisterApiService extends RegisterApiService {
  _$RegisterApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RegisterApiService;

  Future<Response> registerRequest(Map<String, dynamic> body) {
    final $url = '/register';
    final $headers = {'Content-Type': 'application/json'};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
