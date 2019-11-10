import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:referease/data/summary_api_service.dart';
import 'package:referease/model/summary_model.dart';


Future<bool> requestAddSummary (BuildContext context, SummaryModel summary) async{

  bool isOk  = false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final response = await Provider.of<SummaryApiService>(context).addSummary(bearer, summary);

  if(response.statusCode==201){
    isOk= true;
  }

  return isOk;
}