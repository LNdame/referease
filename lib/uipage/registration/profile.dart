import 'dart:async';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:referease/data/api_functions/request_profile_details.dart';
import 'package:referease/model/user_model.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/uipage/pages/helpers/profile_background.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/data/api_functions/request_profile_api.dart';


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
  //  getProfileDetails(context);
    

           profileDetailsRequest(context).then((onValue) {
              final UserModel user = onValue.body;
               firstNameController.text = user.first_name;
              lastNameController.text = user.last_name;
              studyLevelController.text = user.level_of_study;
              instController.text = user.institution;
              facultyController.text = user.faculty;
              
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
          floatingActionButton: FloatingActionButton(child: Icon(Icons.save),
          onPressed: (){
                        if (_formKey.currentState.validate()) {
                               var lastName = lastNameController.text;
                                        var firstName = firstNameController.text;
                                        var levelStudy = studyLevelController.text;
                                        var institution = instController.text;
                                        var faculty = facultyController.text; 
                                        
                                        profileRequest(context, lastName, firstName, levelStudy, institution, faculty);   
                  }

          }),
                  
                  
                  
                  
                      );//scaffold
                  
                    }
    
 FutureBuilder<Response<UserModel>> getProfileDetails(BuildContext context){
    
    return FutureBuilder<Response<UserModel>>(
       future: profileDetailsRequest(context),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          
                   }else{
                      final UserModel user = snapshot.data.body;
                      if (user.first_name == null && user.last_name == null) {
                          //Do something
                      }
                   }
                   return Center();
                 },
           
               );
                   }
           
              }
              
              

              
              
              typedef Null ValueChangeCallback (String value);
              



