import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/api_functions/request_login_api.dart';

import '../register_api_service.dart';

Future requestRegisterAPI (BuildContext context, String username, String password) async{

  Map<String, String> body ={
    'username':username,
    'password': password,
  };

  final response = await Provider.of<RegisterApiService>(context).registerRequest(body);

  if (response.statusCode == 201){
     print(response.body);
     print('starting login process');
     requestLoginAPI(context, username, password);
  }

}