// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AnswerApiService extends AnswerApiService {
  _$AnswerApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AnswerApiService;

  Future<Response<BuiltList<AnswerModel>>> getAnswers(String bearer, int id) {
    final $url = '/answers/${id}';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<BuiltList<AnswerModel>, AnswerModel>($request);
  }

  Future<Response<AnswerModel>> getAnswer(String bearer, int id) {
    final $url = '/answer/${id}';
    final $headers = {'Authorization': bearer};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<AnswerModel, AnswerModel>($request);
  }

  Future<Response<AnswerModel>> addAnswer(String bearer, AnswerModel body) {
    final $url = '/answer/0';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<AnswerModel, AnswerModel>($request);
  }

  Future<Response<AnswerModel>> updateAnswer(
      String bearer, AnswerModel body, int id) {
    final $url = '/answer/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $body = body;
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<AnswerModel, AnswerModel>($request);
  }

  Future<Response> deleteAnswer(String bearer, int id) {
    final $url = '/answer/${id}';
    final $headers = {
      'Authorization': bearer,
      'Content-Type': 'application/json'
    };
    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
