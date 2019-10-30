import 'package:flutter/material.dart';
import 'package:referease/uipage/registration/profile.dart';
import 'package:referease/data/api_functions/request_profile_api.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState()=>  _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: UserProfile(),
    );
  }
}