import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';

import '../profile_api_service.dart';


Future<dynamic> profileDetailsRequest(context) async {
        var accessToken;
        String bearer;
              
       accessToken = await requestRefreshToken(context);
       bearer = "Bearer $accessToken";
        print("bearer is in add $bearer");
        final response =
        await Provider.of<ProfileApiService>(context).profileDetailsRequest(bearer);

       
        dynamic body = response.body;

        return body;
   

        
    }