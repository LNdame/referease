import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/answer_api_service.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/answer_model.dart';
import 'package:built_collection/built_collection.dart';

Future <Response<BuiltList<AnswerModel>>> requestAnswers(BuildContext context, int id) async{

  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final response = await Provider.of<AnswerApiService>(context).getAnswers(bearer, id);

  if (response.statusCode == 200) {
    return response;
  }

  return response;
}