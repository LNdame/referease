// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$QuestionnairesApiService extends QuestionnairesApiService {
  _$QuestionnairesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = QuestionnairesApiService;

  Future<Response<BuiltList<Questionnaire>>> getQuestionnaires() {
    final $url = '/questionnaires';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<BuiltList<Questionnaire>, Questionnaire>($request);
  }

  Future<Response> getQuestionnaire(int id) {
    final $url = '/questionnaires/${id}';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
