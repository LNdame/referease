import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/answer_api_service.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/answer_model.dart';

Future <bool> requestUpdateAnswer(BuildContext context, AnswerModel answer)async{
  bool isOK=false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final response = await Provider.of<AnswerApiService>(context).updateAnswer(bearer, answer, answer.id);

  if(response.statusCode==200){
    isOK=true;
  }

  return isOK;
}