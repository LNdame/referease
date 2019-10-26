import 'dart:async';

import 'package:flutter/material.dart';
import 'package:referease/shared_preference/shared_constants.dart';
 import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils{

  /// Instantiation of the shared preferences
  ///

  static final String _kUserUID = "uid";
  static final String _kUserEmail ="user_email";
  static final String _kUserDisplayName = "user_name";
  static final String _kUserFirstLaunch = "first_launch";


  // getter firstlaunch
  static Future<bool> getisFirstLaunch() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kUserFirstLaunch) ?? true;
  }

  //setter firstlaunch
  static Future<bool> setisFirstLaunch(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_kUserFirstLaunch, value);
  }

  // getter uid
  static Future<String> getUserUID() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kUserUID) ?? '';
  }

  //setter uid
  static Future<bool> setUserUid(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kUserUID, value);
  }

  // getter email
  static Future<String> getUserEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kUserEmail) ?? '';
  }

  static Future<String> getUsername() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedConstants.usernameKey) ?? '';
  }
  static Future<String> getPassword() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedConstants.passwordKey) ?? '';
  }


  //setter email
  static Future<bool> setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kUserEmail, value);
  }

  // getter displayname
  static Future<String> getUserDisplayName() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kUserDisplayName) ?? '';
  }

  //setter displayname
  static Future<bool> setUserDisplayName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kUserDisplayName, value);
  }

  static Future<bool> setSourceTypes(List<String> value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(SharedConstants.sourceTypeKey, value);
  }

  static Future<List<String>> getSourceTypes() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(SharedConstants.sourceTypeKey) ?? null;
  }

  static Future<String> getAccessToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedConstants.accessTokenKey) ?? '';
  }

  static Future<String> getRefreshToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedConstants.refreshTokenKey) ?? '';
  }

  //setter uid
  static Future<bool> seAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedConstants.accessTokenKey, value);
  }

}