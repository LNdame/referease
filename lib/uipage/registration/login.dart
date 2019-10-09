import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/request_login_api.dart';
import 'package:referease/data/source_type_api_service.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:referease/data/login_api_service.dart';
import 'package:referease/data/base_api_service.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  
   

  


  final _usernameController = new TextEditingController();
  final _passwordController = TextEditingController();


  
    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              Column(
                children: <Widget>[

                  SizedBox(height: 76.0),
                  Text('Login'),
                ],
              ),
              SizedBox(height: 120.0),

              AccentColorOverride(
                color: kReferAltYellow,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    //filled: true,
                    labelText: 'Username',
                  ),
                ),
              ),

              //spacer
              SizedBox(height: 12.0,),

              AccentColorOverride(
                color: kReferAltYellow,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    //  filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),

              // TODO: Add button bar (101)
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),

                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))
                    ),

                    onPressed: (){
                      //when pressed
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                  ),
                  RaisedButton(
                    child: Text('NEXT'),
                    elevation: 8.0,

                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0))
                    ),
                    //onPressed: ()=>_signIn().then((FirebaseUser user)=>print(user)),
                    onPressed: () async {
                     // requestLoginAPI(context, "ansteph09@gmail.com", "pass1234");

                      final response = await Provider.of<SourceTypeApiService>(context).getSourceTypes();

                    print(response.body);
//
//                      //final responseST = await Provider.of<SourceTypeApiService>(context).getSourceType("reflect");
//                      final responseST = await Provider.of<SourceTypeApiService>(context).getSourceTypes();
//
//                      print(response.body);
//                      print(responseST.body);
                    }
                  ),
                ],
              )

            ],
          ),
        ),

    );
  }

}






// TODO: Add AccentColorOverride (103)

class AccentColorOverride extends StatelessWidget{
  const AccentColorOverride ({Key key, this.color, this.child}):super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
