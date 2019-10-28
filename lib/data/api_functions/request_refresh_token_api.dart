import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:referease/shared_preference/sharedpreference.dart';

import '../refresh_api_service.dart';

Future<String> requestRefreshToken( BuildContext context)async{
  String token =  await SharedPreferencesUtils.getRefreshToken() ;

  final response = await Provider.of<RefreshApiService>(context)
        .getRefreshToken("Bearer $token");

    if (response.statusCode == 200) {
      token = response.body['access_token'];
      print("new access token: $token");
      SharedPreferencesUtils.seAccessToken(token); }

   return token;
}