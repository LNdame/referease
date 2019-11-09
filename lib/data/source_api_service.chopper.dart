// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SourceApiService extends SourceApiService {
  _$SourceApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SourceApiService;

  Future<Response<BuiltList<SourceModel>>> getSources(String bearer) {
    final $url = '/sources';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<BuiltList<SourceModel>, SourceModel>($request);
  }

  Future<Response<SourceModel>> getSource(String bearer, int id) {
    final $url = '/source/${id}';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SourceModel, SourceModel>($request);
  }

  Future<Response<SourceModel>> addSource(String bearer, SourceModel body) {
    final $url = '/source/0';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SourceModel, SourceModel>($request);
  }

  Future<Response<SourceModel>> updateSource(
      String bearer, SourceModel body, int id) {
    final $url = '/source/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SourceModel, SourceModel>($request);
  }

  Future<Response> deleteSource(String bearer, int id) {
    final $url = '/source/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
