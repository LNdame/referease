import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:referease/data/summary_api_service.dart';
import 'package:referease/model/summary_model.dart';


Future<Response<SummaryModel>> requestAddSummary (BuildContext context, SummaryModel summary, String bearer) async{

  final response = await Provider.of<SummaryApiService>(context).addSummary(bearer, summary);

  if(response.statusCode==201){
   return response;
  }

  return response;
}