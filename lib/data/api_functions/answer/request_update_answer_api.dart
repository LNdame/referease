import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/answer_api_service.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/answer_model.dart';

Future <Response<AnswerModel>> requestUpdateAnswer(BuildContext context, AnswerModel answer, String bearer)async{
 /* bool isOK=false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";*/
  final response = await Provider.of<AnswerApiService>(context).updateAnswer(bearer, answer, answer.id);

  if(response.statusCode==200){
    return response;
  }

  return response;
}