import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/data/source_api_service.dart';
import 'package:referease/model/source_model.dart';


Future<bool> requestAddSource (BuildContext context, SourceModel source) async{

  bool isOk  = false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  print("bearer is in add $bearer");
  final response = await Provider.of<SourceApiService>(context).addSource(bearer, source);

    if(response.statusCode==201){
      isOk= true;
    }

  return isOk;
}