// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_type_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SourceTypeApiService extends SourceTypeApiService {
  _$SourceTypeApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SourceTypeApiService;

  Future<Response<BuiltList<SourceType>>> getSourceTypes() {
    final $url = '/source_types';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<SourceType>, SourceType>($request);
  }

  Future<Response<SourceType>> getSourceType(String name) {
    final $url = '/source_type/${name}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SourceType, SourceType>($request);
  }
}
