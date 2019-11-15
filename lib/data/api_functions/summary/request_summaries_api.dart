
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:referease/model/summary_model.dart';

import '../../summary_api_service.dart';


Future<Response<BuiltList<SummaryModel>>> requestSummaries(BuildContext context) async {

  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final response = await Provider.of<SummaryApiService>(context).getSummaries(
      bearer);

  if (response.statusCode == 200) {
    return response;
  }

  return response;
}