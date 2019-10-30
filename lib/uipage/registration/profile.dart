import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:referease/data/api_functions/request_profile_details.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/services/usermanagement.dart';
import 'package:referease/data/api_functions/request_profile_api.dart';
import 'package:referease/model/login_model.dart';
import 'package:referease/data/api_functions/request_refresh_token_api.dart';


class UserProfile extends StatefulWidget{


  @override
  UserProfileState createState() => new UserProfileState();

}

class UserProfileState extends State<UserProfile> {

   final TextEditingController firstNameController = new TextEditingController();
   final TextEditingController lastNameController = new TextEditingController();
   final TextEditingController studyLevelController = new TextEditingController();
   final TextEditingController instController = new TextEditingController();
   final TextEditingController facultyController = new TextEditingController();
        final _formKey = GlobalKey<FormState>(); 

  File sampleImage;

  QuerySnapshot userData;
 
  Future getImage() async{
      var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        sampleImage = tempImage;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     profileDetailsRequest(context).then((onValue) {
       var responseBody = onValue;
       if (responseBody['first_name'] != "") {
         firstNameController.text = responseBody['first_name'];
         lastNameController.text = responseBody['last_name'];
         studyLevelController.text = responseBody['level_of_study'];
         instController.text = responseBody['institution'];
        // facultyController.text = responseBody['']
       }
     });

    }

  saveDisplayRef(String dpn) async{
    await SharedPreferencesUtils.setUserDisplayName(dpn);
  }

  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar:AppBar(
        brightness: Brightness.light,
        title: Text('Refer Easy'),
        elevation: 0.0,
        /* IconButton(
                icon:Icon(Icons.menu,semanticLabel: 'menu',),

                onPressed: (){
                  _menuController.openMenu(true);
                  print('Menu button');
                }),*/

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, semanticLabel: 'save',),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                           var lastName = lastNameController.text;
                                    var firstName = firstNameController.text;
                                    var levelStudy = studyLevelController.text;
                                    var institution = instController.text;
                                    var faculty = facultyController.text; 
                                    
                                    profileRequest(context, lastName, firstName, levelStudy, institution, faculty);   
              }
                                                                   
                         
                          },
                        ),
              
                      ],
                    ),
              
      //               drawer: UIDrawer(),
              
                    body:
                    Form(
                      key: _formKey,
                      child:
                          Stack(
                              fit: StackFit.expand,
                            children: <Widget>[
                              ProfileBackground(),
                              Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100.0,
                              ),
                              Column(
                                  children: <Widget>[
                  
                                Text(
                                'About me',
                                style:
                                TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                                   ),
                  
                                SizedBox(height: 10.0,),
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                                          TextFormField(
                                            validator: (String val) {
                                              if (val.trim().isEmpty) {
                                                return 'Please enter last name';
                                              }
                                              else if (val.length < 3) {
                                                return 'Last name must be at least 2 characters';
                                              }
                                              },
                                            controller: lastNameController,
                                            decoration: InputDecoration(
                                                labelText: 'Last Name',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: kReferAltDarkGrey),
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: kReferAccent))
                                            ),//decor
                  
                                          ),
                                          SizedBox(height: 10.0,),
                                          TextFormField(
                                            validator: (String val) {
                                              if (val.trim().isEmpty) {
                                                return 'Please first name';
                                              }
                                              else if (val.length < 3) {
                                                return 'First name must be at least 2 characters';
                                              }
                                              },
                                            controller: firstNameController,
                                            decoration: InputDecoration(
                                                labelText: 'First Name',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: kReferAltDarkGrey),
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: kReferAccent))
                                            ),//decor
                  
                                          ),
                  
                  
                  
                  
                                   // SizedBox(height: 10.0,),
                  
                                    SizedBox(height: 10.0,),
                                    TextFormField(
                                      validator: (String val) {
                                              if (val.trim().isEmpty) {
                                                return 'Please enter level of study';
                                              }
                                              else if (val.length < 3) {
                                                return 'Level of must be at least 3 characters';
                                              }
                                              },
                                      controller: studyLevelController,
                                      decoration: InputDecoration(
                                          labelText: 'Level of Study',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: kReferAltDarkGrey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: kReferAccent))
                                      ),//decor
                  
                                    ),
                                    SizedBox(height: 10.0,),
                                    TextFormField(
                                      validator: (String val) {
                                              if (val.trim().isEmpty) {
                                                return 'Please enter institution';
                                              }
                                              else if (val.length < 3) {
                                                return 'Institution must be at least 2 characters';
                                              }
                                              },
                                      controller: instController,
                                      decoration: InputDecoration(
                                          labelText: 'Institution',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: kReferAltDarkGrey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: kReferAccent))
                                      ),//decor
                  
                                    ),
                                    SizedBox(height: 10.0,),
                                    TextFormField(
                                      validator: (String val) {
                                              if (val.trim().isEmpty) {
                                                return 'Please enter faculty';
                                              }
                                              else if (val.length < 3) {
                                                return 'Faculty must be at least 2 characters';
                                              }
                                              },
                                      controller: facultyController,
                                      decoration: InputDecoration(
                                          labelText: 'Faculty',
                                          labelStyle: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: kReferAltDarkGrey),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: kReferAccent))
                                      ),//decor
                  
                                    ),
                  
                                  ],//widget
                              )//column
                            ],//widgets
                          ),//column
                        ),//scrollview
                      ),
                            ],
                             ),
              
              
              
              
                      ),
                    
                   /* floatingActionButton: FloatingActionButton(
                        tooltip: 'Save profile',
                        child: Icon(Icons.save),
                        onPressed: null),
              
                    bottomNavigationBar: BottomAppBar( elevation: 8.0,
              
                      color: kReferPrimary,
                      child: Container( height: 50.0,
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          children: <Widget>[
              
                          ],
                        ),
                      ),
                      shape: CircularNotchedRectangle(),
                    ),
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
              
              
              
              
                  );//scaffold
              
                }
              
              }
              
              
              class getClipper extends CustomClipper<Path> {
                @override
                Path getClip(Size size) {
                  var path = new Path();
              
                  path.lineTo(0.0, size.height / 4);
                  path.lineTo(size.width + 415, 0.0);
                  path.close();
                  return path;
                }
              
                @override
                bool shouldReclip(CustomClipper<Path> oldClipper) {
                  // TODO: implement shouldReclip
                  return true;
                }
              }
              
              class ArcClipper extends CustomClipper<Path> {
                @override
                Path getClip(Size size) {
                  var path = new Path();
                  path.lineTo(0.0, size.height - 30);
              
                  var firstControlPoint = new Offset(size.width / 4, size.height);
                  var firstPoint = new Offset(size.width / 2, size.height);
                  path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
                      firstPoint.dx, firstPoint.dy);
              
                  var secondControlPoint =
                  new Offset(size.width - (size.width / 4), size.height);
                  var secondPoint = new Offset(size.width, size.height - 30);
                  path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
                      secondPoint.dx, secondPoint.dy);
              
                  path.lineTo(size.width, 0.0);
                  path.close();
              
                  return path;
                }
              
                @override
                bool shouldReclip(CustomClipper<Path> oldClipper) => false;
              }
              
              class ProfileBackground extends StatelessWidget{
              
                Widget topHalf(BuildContext context) {
                  var deviceSize = MediaQuery.of(context).size;
                  return new Flexible(
                    flex: 1,
                    child: ClipPath(
                      clipper: new ArcClipper(),
                      child: Stack(
                        children: <Widget>[
                          new Container(
                            decoration: new BoxDecoration(
                                  color: kReferPrimary,
                                ),
                          ),
                           new Center(
                            child:  Container(
              
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
              
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/pilebook.png"),
                                       // NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                        fit: BoxFit.cover),
                                  /*  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 7.0, color: kReferAltDarkGrey, spreadRadius: 3.0)
                                    ]))*/
              
              
              
                          )
                            ))
                        ],
                      ),
                    ),
                  );
                }
              
                final bottomHalf = new Flexible(
                  flex: 4,
                  child: new Container(),
                );
              
                @override
                Widget build(BuildContext context) {
                  // TODO: implement build
                  return new Column(
                    children: <Widget>[topHalf(context), bottomHalf],
                  );
                }
              }
              
              
              typedef Null ValueChangeCallback (String value);
              



