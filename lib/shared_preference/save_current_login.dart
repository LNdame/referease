import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:referease/model/login_model.dart';


saveCurrentLogin(Map responseJson) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var username;
  if((responseJson != null && responseJson.isNotEmpty)){
    username = LoginModel.fromJson(responseJson).user.username;

  }else{
    username = "";
  }
  print('saving to shared pref');
  var accessToken = (responseJson != null && responseJson.isNotEmpty)? LoginModel.fromJson(responseJson).accessToken:"";
  var refreshToken = (responseJson != null && responseJson.isNotEmpty)? LoginModel.fromJson(responseJson).refreshToken:"";
  print('access token: $accessToken ' );
  print('username : $username');
  await preferences.setString('username', (username !=null && username.length>0)?username:"");
  await preferences.setString('accesstoken', (accessToken !=null && accessToken.length>0)?accessToken:"");
  await preferences.setString('refreshtoken', (refreshToken !=null && refreshToken.length>0)?refreshToken:"");


}