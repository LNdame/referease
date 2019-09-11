import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/services/usermanagement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';




class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin{

ProgressDialog pr;
  Animation animation, delayedAnimation, muchDelayedAnimation;

  AnimationController animationController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
   String registerExceptionMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve:Interval(0.5, 1.0, curve:Curves.fastOutSlowIn  ) ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve:Interval(0.8, 1.0, curve:Curves.fastOutSlowIn  ) ));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {

     pr = new ProgressDialog(context,ProgressDialogType.Normal);
    pr.setMessage('Please wait...');
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child){
          return new Scaffold(
             // resizeToAvoidBottomPadding: false,
              body: ListView(
                                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 1.0),
                children: <Widget>[
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0,0.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                          child: Text(
                            'Sign Up',
                            style:
                            TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(280.0, 75.0, 0.0, 0.0),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: kReferAccent),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: kReferAccent))),
                          ),
                          SizedBox(height: 10.0),
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


                          SizedBox(height: 55.0),
                          Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: kReferAccentDark,
                                color: kReferAccent,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    //what happen when sign up
                                    if (_emailController.text == "" || _passwordController.text == "")
                                      {
                                        noInputDialog(context);
                                      }
                                      else{
                                        pr.show();
                                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: _emailController.text, password: _passwordController.text)
                                        .then((signedInUser){
                                          UserManagement().storeNewUser(signedInUser, context);

                                    }).catchError((e){
                                      pr.hide();
                                      print(e);
                                       String exceptionMessage = e.toString();
                                        if (exceptionMessage == "PlatformException(exception, The email address is badly formatted., null)")
                                        {
                                          registerExceptionMessage = "Invalid email address";
                                        }
                                        else {
                                          registerExceptionMessage = "Please ensure you have entered correct credentials";
                                        }
                                         registerErrorDialog(context, registerExceptionMessage);
                                    });
                                      }
                                 },
                                  child: Center(
                                    child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:

                                Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),


                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ])
                ],
                
              )
              
              
               );
        }

    );



    // SizedBox(height: 15.0),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       'New to Spotify?',
    //       style: TextStyle(
    //         fontFamily: 'Montserrat',
    //       ),
    //     ),
    //     SizedBox(width: 5.0),
    //     InkWell(
    //       child: Text('Register',
    //           style: TextStyle(
    //               color: Colors.green,
    //               fontFamily: 'Montserrat',
    //               fontWeight: FontWeight.bold,
    //               decoration: TextDecoration.underline)),
    //     )
    //   ],
    // )

  }
}
Future<bool> noInputDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Please enter the username and password'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                    Navigator.pop(context);
            },
          )
        ],
      );
    }
  );
}

Future<bool> registerErrorDialog(context, message) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                    Navigator.pop(context);            
            },
          )
        ],
      );
    }
  );
}