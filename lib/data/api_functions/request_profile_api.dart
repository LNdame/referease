import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';

import '../profile_api_service.dart';


Future<bool> profileRequest(
    BuildContext context, String lastName, String firstName, String studyLevel, String institution, String faculty) async {
      Map<String, dynamic> body = {
        'last_name': lastName,
        'first_name': firstName,
        'level_of_study': studyLevel,
        'institution': institution,
        'faculty': faculty
      };
        var accessToken;
        String bearer;
        bool done = false;
        
       accessToken = await requestRefreshToken(context);
       bearer = "Bearer $accessToken";
        print("bearer is in add $bearer");
             var code;
        final response =
        await Provider.of<ProfileApiService>(context).profileRequest(bearer, body);

        code = response.statusCode;
        if (code == 200)
        {
          done = true;
          Navigator.of(context).popAndPushNamed('/home');
        }

        return done;
   

        
    }