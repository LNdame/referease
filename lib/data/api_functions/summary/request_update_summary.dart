import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/answer/request_add_answer_api.dart';
import 'package:referease/data/api_functions/answer/request_update_answer_api.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/api_functions/summary/request_add_summary_api.dart';
import 'package:referease/data/api_functions/summary/request_update_summary_api.dart';
import 'package:referease/model/answer_model.dart';
import 'package:referease/model/summary_model.dart';

Future<bool> requestUpdateSummaryCom(BuildContext context, SummaryModel summary,
    List<AnswerModel> answers) async {
  bool isOk = false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final summaryResponse = await requestUpdateSummary(context, summary, bearer);

  if (summaryResponse.statusCode == 200)  {
    isOk = true;
    int summaryId = summaryResponse.body.id;

    for (var i = 0; i < answers.length; ++i)  {
      var response =  await saveAnswer(answers[i], context, bearer);
    }
    //answers.forEach((ans) =>()async {await saveAnswer(ans, summaryId, context, bearer);} );
  }

  return isOk;
}

Future <Response<AnswerModel>>  saveAnswer(
    AnswerModel answer,  BuildContext context, String bearer) {

  return requestUpdateAnswer(context, answer, bearer);

}
