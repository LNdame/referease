// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SummaryApiService extends SummaryApiService {
  _$SummaryApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SummaryApiService;

  Future<Response<BuiltList<SummaryModel>>> getSummaries(String bearer) {
    final $url = '/reading_summaries';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<BuiltList<SummaryModel>, SummaryModel>($request);
  }

  Future<Response<SummaryModel>> getSummary(String bearer, int id) {
    final $url = '/reading_summary/${id}';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SummaryModel, SummaryModel>($request);
  }

  Future<Response<SummaryModel>> addSummary(String bearer, SummaryModel body) {
    final $url = '/reading_summary/0';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SummaryModel, SummaryModel>($request);
  }

  Future<Response<SummaryModel>> updateSummary(
      String bearer, SummaryModel body, int id) {
    final $url = '/reading_summary/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SummaryModel, SummaryModel>($request);
  }

  Future<Response> deleteSummary(String bearer, int id) {
    final $url = '/reading_summary/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
