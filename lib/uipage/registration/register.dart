import 'package:flutter/material.dart';
import 'package:referease/data/api_functions/request_register_api.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'package:progress_dialog/progress_dialog.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
        ProgressDialog pr;
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  String value = "SIGNUP";  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

       final _formKey = GlobalKey<FormState>(); 
     final scaffoldKey = GlobalKey<ScaffoldState>();

    void _submitCommand() {
     final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
    }
  }

  Future<bool> registerErrorDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Something went wrong'),
        content: Text('Please enter your details again'),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
                setState(() {
                      value = 'SIGNUP';
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
  void initState() {
    // TODO: implement initState


    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
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

   

    final double width = MediaQuery.of(context).size.width;
     pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            key: scaffoldKey,
            //  resizeToAvoidBottomPadding: false,
              body: Form(
                key: _formKey,
                  child: ListView(
                      children :<Widget>[ Column(
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
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 80.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(280.0, 75.0, 0.0, 0.0),
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
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0.0, 0.0),
                          child: Container(
                              padding: EdgeInsets.only(
                                  top: 35.0, left: 20.0, right: 20.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                  validator:( String val) {
                                    if( !EmailValidator.validate(val.trimRight(), true))
                                      {
                                        return 'Please enter a valid E-mail address';
                                          }
                                       },
                                    onSaved: (val) => _emailController.text = val,
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
                                            borderSide:
                                                BorderSide(color: kReferAccent))),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                  validator: (String val) {
                                      if (val.isEmpty) {
                                        return 'Please enter password';
                                          }
                                          else if (val.length < 5)
                                          {
                                            return 'Password must be at least 6 characters';
                                          }         
                                         },
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: kReferAltDarkGrey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kReferAccent))),
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
                                       onTap: () async {
                                         
                                         if (_formKey.currentState.validate())
                                            {
                                            setState(() {
                                            value = 'LOADING ...';
                                            
                                              });
                                               requestRegisterAPI(
                                               context,
                                              _emailController.text.trim(),
                                              _passwordController.text.trim()).then((onValue) {

                                                  }).catchError((onError) {
                                                    registerErrorDialog(context);
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
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
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
                      ])],
                  ),
              ));
        });
  }
}
