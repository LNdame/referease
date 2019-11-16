import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/request_login_api.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:progress_hud/progress_hud.dart';



class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
 
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    String value = "LOGIN";
     final _formKey = GlobalKey<FormState>();
     final scaffoldKey = GlobalKey<ScaffoldState>();
     bool _showPassword = false;


  Future<bool> loginErrorDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Incorrect login details'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                     setState(() {

                      value = 'LOGIN';
                        });
                    Navigator.pop(context);

            },
          )
        ],
      );
    }
  );
}




  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    Future.delayed(Duration(seconds: 2))
        .then((dynamic) => SharedPreferencesUtils.getUsername())
        .then((username) {
          if(username.isNotEmpty){
            SharedPreferencesUtils.getPassword().then((pwd){
                print('silently signing in user $username');
                requestLoginAPI(
                    context,
                    username,
                    pwd);
            });
          }
       }) ;
  }


@override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            key: scaffoldKey,
             // resizeToAvoidBottomPadding: false,
              body: Form(
                key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 1.0),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Transform(
                            transform: Matrix4.translationValues(
                                animation.value * width, 0.0, 0.0),
                            child: Container(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                                    child: Text('Hello',
                                        style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 140.0, 0.0, 0.0),
                                    child: Text('There',
                                        style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        220.0, 140.0, 0.0, 0.0),
                                    child: Text('.',
                                        style: TextStyle(
                                            fontSize: 80.0,
                                            fontWeight: FontWeight.bold,
                                            color: kReferAccent)),
                                  )
                                ],
                              ),
                            ),
                          ), //transform

                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0.0, 0.0),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 35.0, left: 20.0, right: 20.0),

                                   child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                                                                  validator: validateEmail,
                                                                                   onSaved: (val) => _emailController.text = val,
                                                                                 controller: _emailController,
                                                                                 keyboardType: TextInputType.emailAddress,
                                                                                 decoration: InputDecoration(
                                                                                     labelText: 'Email',
                                                                                     labelStyle: TextStyle(
                                                                                         fontFamily: 'Montserrat',
                                                                                         fontWeight: FontWeight.bold,
                                                                                         color: kReferAltDarkGrey),
                                                                                     focusedBorder: UnderlineInputBorder(
                                                                                         borderSide: BorderSide(
                                                                                             color: kReferAccent))),
                                         
                                                                               ),
                                                                               SizedBox(height: 20.0),
                                                                               TextFormField(
                                                                                 controller: _passwordController,
                                                                                 decoration: InputDecoration(
                                                                                     labelText: 'Password',
                                                                                     suffixIcon: GestureDetector(
                                                                                       onTap: () {
                                                                                         setState(() {
                                                                                           _showPassword = !_showPassword;
                                                                                         });
                                                                                       },
                                                                                       child: Icon(
                                                                                         _showPassword ? Icons.visibility : Icons.visibility_off,
                                                                                       ),
                                                                                     ),
                                                                                     labelStyle: TextStyle(
                                                                                         fontFamily: 'Montserrat',
                                                                                         fontWeight: FontWeight.bold,
                                                                                         color: kReferAltDarkGrey),
                                                                                     focusedBorder: UnderlineInputBorder(
                                                                                         borderSide: BorderSide(
                                                                                             color: kReferAccent))),
                                                                                 validator: (String val) {
                                                                                       if (val.isEmpty) {
                                                                                         return 'Please enter password';
                                                                                       }
                                         
                                                                                 },
                                                                                 obscureText: !_showPassword,
                                                                               ),
                                                                               SizedBox(height: 5.0),
                                                                               Container(
                                                                                 alignment: Alignment(1.0, 0.0),
                                                                                 padding:
                                                                                     EdgeInsets.only(top: 15.0, left: 20.0),
                                                                                 child: InkWell(
                                                                                   onTap: () {
                                                                                        Navigator.of(context).pushNamed('/resset');
                                                                                   },
                                                                                   child: Text(
                                                                                     'Forgot Password',
                                                                                     style: TextStyle(
                                                                                         color: kReferAccent,
                                                                                         fontWeight: FontWeight.bold,
                                                                                         fontFamily: 'Montserrat',
                                                                                         decoration:
                                                                                             TextDecoration.underline),
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
                                         
                                         
                                                                                       if (_formKey.currentState.validate())
                                                                                       {
                                                                                           setState(() {
                                                                                           value = 'LOADING ..';
                                                                                             });
                                                                                         requestLoginAPI(
                                                                                           context,
                                                                                           _emailController.text.trim(),
                                                                                           _passwordController.text.trim()).then((onValue) {
                                         
                                                                                           }).catchError((onError) {
                                                                                             loginErrorDialog(context);
                                                                                           });
                                         
                                         
                                         
                                         
                                         
                                                                                       }
                                         
                                                                                     },
                                                                                     child: Center(
                                                                                       child: Text(
                                                                                         value,
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
                                                                             ],
                                                                           ),
                                                                         ),
                                                                   ), //transform
                                                                   SizedBox(height: 15.0),
                                                                   Transform(
                                                                     transform: Matrix4.translationValues(
                                                                         muchDelayedAnimation.value * width, 0.0, 0.0),
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
                                                             ]),
                                                       ));
                                                 });
                                           }
                                         
                                           String validateEmail(String value) {
                                             Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                            RegExp regex = new RegExp(pattern);
                                            if (!regex.hasMatch(value.trim()))
                                              return 'Enter Valid Email';
                                            else if( !EmailValidator.validate(value.trim(), true))
                                                 return 'Enter Valid E-mail';
                                            else
                                              return null;
  }
}