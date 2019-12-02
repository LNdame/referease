import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logout_api_service.dart';

Future<bool> logoutRequest(BuildContext context) async {
  bool done = false;
  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  print("bearer is in add $bearer");

  final response =
      await Provider.of<LogoutApiService>(context).logoutRequest(bearer);

  if (response.statusCode == 200) {
    done = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(context).popAndPushNamed('/login');
  }
  return done;
}
