import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/user_model.dart';
import '../profile_api_service.dart';

Future<bool> profileRequest(
    BuildContext context,
    String lastName,
    String firstName,
    String studyLevel,
    String institution,
    String faculty) async {
  final body = new UserModel((b) => b
    ..last_name = lastName
    ..first_name = firstName
    ..level_of_study = studyLevel
    ..institution = institution
    ..faculty = faculty);

  bool done = false;

  var accessToken = await requestRefreshToken(context);
  String bearer = "Bearer $accessToken";
  print("bearer is in add $bearer");

  final response = await Provider.of<ProfileApiService>(context)
      .profileRequest(bearer, body);

  if (response.statusCode == 200) {
    done = true;
    Navigator.of(context).popAndPushNamed('/home');
  }
  return done;
}
