import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:referease/model/login_model.dart';
import 'package:referease/shared_preference/save_current_login.dart';
import '../login_api_service.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {

  Map<String, String> body ={
    'username':username,
    'password': password,
  };

  final response = await Provider.of<LoginApiService>(context).loginRequest(body);

  if(response.statusCode == 200){
    final responseJson = response.body;
    print('getting the login data from server');
    var login = new LoginModel.fromJson(responseJson);
    print(response.body);
    saveCurrentLogin(responseJson);
    // TODO let the user into the landing
   // Navigator.of(context).pushReplacementNamed('Homescreen');
    return login;
  }else{return null;}


}