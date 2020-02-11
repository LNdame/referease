import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/summary_api_service.dart';
import 'package:referease/model/summary_model.dart';


Future<Response<SummaryModel>> requestUpdateSummary (BuildContext context, SummaryModel summary, String bearer) async{

  final response = await Provider.of<SummaryApiService>(context).updateSummary(bearer, summary, summary.id);

  if(response.statusCode==200){
    return response;
  }

  return response;
}