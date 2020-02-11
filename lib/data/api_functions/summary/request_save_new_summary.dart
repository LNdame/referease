import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/answer/request_add_answer_api.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/api_functions/summary/request_add_summary_api.dart';
import 'package:referease/model/answer_model.dart';
import 'package:referease/model/summary_model.dart';

Future<bool> requestSaveNewSummary(BuildContext context, SummaryModel summary,
    List<AnswerModel> answers) async {
  bool isOk = false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final summaryResponse = await requestAddSummary(context, summary, bearer);

  if (summaryResponse.statusCode == 201)  {
    isOk = true;
    int summaryId = summaryResponse.body.id;

    for (var i = 0; i < answers.length; ++i)  {
     var response =  await saveAnswer(answers[i], summaryId, context, bearer);
    }
    //answers.forEach((ans) =>()async {await saveAnswer(ans, summaryId, context, bearer);} );
  }

  return isOk;
}

Future <Response<AnswerModel>>  saveAnswer(
    AnswerModel answer, int summaryId, BuildContext context, String bearer) {
  AnswerModel answerMod = AnswerModel(
          (b)=>b
  ..answer_body=answer.answer_body
  ..questionnaire_id=answer.questionnaire_id
  ..question_id=answer.question_id
  ..reading_summary_id=summaryId
  );
 return requestAddAnswer(context, answerMod, bearer);

}
