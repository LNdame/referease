import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:referease/services/authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SplashPage extends StatefulWidget{


  @override
  _SplashPageState createState() =>new _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    //listen for our auth event(on reload or start

    _auth.onAuthStateChanged.firstWhere((user)=> user!=null).then((user){
      Navigator.popAndPushNamed(context, '/landing');
    });

    Future.delayed(Duration(seconds: 3)).then((dynamic)=>
        Navigator.pushReplacementNamed(context, '/login'));


//    signInWithGoogle());


  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(

            constraints: BoxConstraints(maxWidth: 250.0, maxHeight: 250.0),
              child: Image.asset('assets/images/refereasylogo.png')
          ),
          SizedBox(height: 80.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 20.0,),
              Text("Please wait...")
            ],//row widget
          )//row
        ],//col widget
      ),//column
    );
  }


}