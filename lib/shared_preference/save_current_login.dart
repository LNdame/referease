import 'dart:developer';

import 'package:referease/shared_preference/shared_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:referease/model/login_model.dart';


saveCurrentLogin(Map responseJson) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var username="";
  var password ="";
  if((responseJson != null && responseJson.isNotEmpty)){
    username = LoginModel.fromJson(responseJson).user.username;
    password =LoginModel.fromJson(responseJson).user.password;
  }

  print('saving to shared pref');
  var accessToken = (responseJson != null && responseJson.isNotEmpty)? LoginModel.fromJson(responseJson).accessToken:"";
  var refreshToken = (responseJson != null && responseJson.isNotEmpty)? LoginModel.fromJson(responseJson).refreshToken:"";
  print('access token: $accessToken ' );
  print('username : $username');
  await preferences.setString(SharedConstants.usernameKey, (username !=null && username.length>0)?username:"");
  await preferences.setString(SharedConstants.passwordKey, (password !=null && password.length>0)?password:"");
  await preferences.setString(SharedConstants.accessTokenKey, (accessToken !=null && accessToken.length>0)?accessToken:"");
  await preferences.setString(SharedConstants.refreshTokenKey, (refreshToken !=null && refreshToken.length>0)?refreshToken:"");


}