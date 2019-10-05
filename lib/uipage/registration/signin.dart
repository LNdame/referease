import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/request_login_api.dart';
import 'package:referease/services/authentication.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:referease/services/usermanagement.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';



class SignInPage extends StatefulWidget{


  @override
  _SignInPageState createState() => new _SignInPageState();

}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;

  AnimationController animationController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //google sign in
 // GoogleSignIn googleAuth = new GoogleSignIn();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve:Interval(0.5, 1.0, curve:Curves.fastOutSlowIn  ) ));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve:Interval(0.8, 1.0, curve:Curves.fastOutSlowIn  ) ));


//TODO replace this with a silent check if user exist in shared pref and log in
//    Future.delayed(Duration(seconds: 3)).then((dynamic)=>signInWithGoogle()).then((signedInUser){
//      print('silently signed in user ${signedInUser.displayName} ${signedInUser.uid}');
//      Navigator.of(context).pop();
//      Navigator.of(context).pushReplacementNamed('/landing');
//    });

    Future.delayed(Duration(seconds: 2)).then((dynamic)=>SharedPreferencesUtils.getUsername())
        .then((username){
            if(username.isNotEmpty){
              print('silently signing in user $username');
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/home');
            }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child){

          return new Scaffold(
              resizeToAvoidBottomPadding: false,
              body: ListView(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(animation.value * width, 0.0,0.0),
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                              child: Text('Hello',
                                  style: TextStyle(
                                      fontSize: 80.0, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16.0, 140.0, 0.0, 0.0),
                              child: Text('There',
                                  style: TextStyle(
                                      fontSize: 80.0, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(220.0, 140.0, 0.0, 0.0),
                              child: Text('.',
                                  style: TextStyle(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.bold,
                                      color: kReferAccent)),
                            )
                          ],
                        ),
                      ),
                    ),//transform

                    Transform(
                      transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0,0.0),
                      child: Container(
                          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: kReferAltDarkGrey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kReferAccent))),
                              ),
                              SizedBox(height: 20.0),
                              TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: kReferAltDarkGrey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: kReferAccent))),
                                obscureText: true,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                alignment: Alignment(1.0, 0.0),
                                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                                child: InkWell(
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        color: kReferAccent,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: kReferAccentDark,
                                  color: kReferAccent,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () async {
                                      //requestLoginAPI(context, "ansteph09@gmail.com", "pass1234");
                                      requestLoginAPI(context,  _emailController.text.trim(), _passwordController.text.trim());
//                                      FirebaseAuth.instance.signInWithEmailAndPassword(
//                                          email: _emailController.text.trim(), password: _passwordController.text.trim()
//                                      ).then((FirebaseUser user) async {
//
//                                        await SharedPreferencesUtils.setUserUid(user.uid);
//                                        await SharedPreferencesUtils.setUserDisplayName("");
//                                        await SharedPreferencesUtils.setUserEmail(user.email);
//
//                                        Navigator.of(context).pushReplacementNamed('/landing');
//                                      }).catchError((e){
//                                        print(e);
//                                      });


                                    },
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),

//                              Container(
//                                height: 40.0,
//                                color: Colors.transparent,
//                                child: Container(
//                                  decoration: BoxDecoration(
//                                      border: Border.all(
//                                          color: Colors.black,
//                                          style: BorderStyle.solid,
//                                          width: 1.0),
//                                      color: Colors.transparent,
//                                      borderRadius: BorderRadius.circular(20.0)),
//                                  child: GestureDetector(
//                                    onTap: (){
//                                        googleAuth.signIn().then((result){
//                                          result.authentication.then((googleKey){
//                                            FirebaseAuth.instance.signInWithGoogle(
//                                                idToken: googleKey.idToken,
//                                                accessToken: googleKey.accessToken
//                                            ).then((signedInUSer) async {
//
//                                              UserManagement().checkGoogleUser(signedInUSer).then(( results){
//                                                QuerySnapshot qRes = results;
//                                                  if(qRes.documents.length<=0){
//                                                    UserManagement().storeNewUserGoogle(signedInUSer, context);
//                                                  }else{
//                                                    Navigator.of(context).pop();
//                                                    Navigator.of(context).pushReplacementNamed('/landing');
//                                                  }
//
//                                              });
//
//
//                                              print('Signed in user ${signedInUSer.displayName} ${signedInUSer.uid}');
//                                              await SharedPreferencesUtils.setUserUid(signedInUSer.uid);
//                                              await SharedPreferencesUtils.setUserEmail(signedInUSer.email);
//                                              await SharedPreferencesUtils.setUserDisplayName(signedInUSer.displayName);
//
//                                             // Navigator.of(context).pushReplacementNamed('/landing');
//
//
//                                            }).catchError((e){
//                                              print(e);
//                                            });
//
//                                          }).catchError((e){
//                                            print(e);
//                                          });
//                                        }).catchError((e){
//                                                  print(e);
//                                                });
//                                    },
//                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: <Widget>[
//                                        Center(
//                                          child:
//                                          ImageIcon(AssetImage('assets/images/google.png')),
//                                        ),
//                                        SizedBox(width: 10.0),
//                                        Center(
//                                          child: Text('Log in with Google',
//                                              style: TextStyle(
//                                                  fontWeight: FontWeight.bold,
//                                                  fontFamily: 'Montserrat')),
//                                        )
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                              )
                            ],
                          )),
                    ),//transform
                    SizedBox(height: 15.0),
                    Transform(
                      transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0,0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New to Refer Easy ?',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: kReferAccent,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
            ]
              )

          );

        }


    );//animatedbuilder

  }
}