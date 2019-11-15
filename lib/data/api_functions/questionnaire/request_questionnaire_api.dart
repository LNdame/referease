import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/model/questionnaire.dart';

import '../../questionnaire_api_service.dart';

Future<Response<BuiltList<Questionnaire>>> requestQuestionnaires(
    BuildContext context) async {
  final response =
      await Provider.of<QuestionnairesApiService>(context).getQuestionnaires();
  if (response.statusCode == 200) {
    return response;
  }
  return response;
}
