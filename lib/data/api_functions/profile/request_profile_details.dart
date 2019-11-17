  
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';
import 'package:referease/model/user_model.dart';
import 'package:built_collection/built_collection.dart';


import '../../profile_api_service.dart';


Future<Response<UserModel>> profileDetailsRequest(context) async {
        var accessToken;
        String bearer;
              
       accessToken = await requestRefreshToken(context);
       bearer = "Bearer $accessToken";
        print("bearer is in add $bearer");
        final response =
        await Provider.of<ProfileApiService>(context).profileDetailsRequest(bearer);
        return response;  
    }