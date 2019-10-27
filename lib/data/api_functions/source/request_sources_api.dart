
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:referease/model/source_model.dart';
import 'package:built_collection/built_collection.dart';


Future<Response<BuiltList<SourceModel>>> requestSources(BuildContext context) async {

  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  final response = await Provider.of<SourceApiService>(context).getSources(
      bearer);

  if (response.statusCode == 200) {
   return response;
  }

  return response;
}