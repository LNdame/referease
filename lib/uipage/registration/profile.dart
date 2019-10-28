import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:referease/services/usermanagement.dart';


class UserProfile extends StatefulWidget{


  @override
  UserProfileState createState() => new UserProfileState();

}

class UserProfileState extends State<UserProfile> {

  String firstName ;
  String lastName;
  String levelStudy ;
  String institution;
  String faculty;

  File sampleImage;

  QuerySnapshot userData;

  UserManagement userMan= new UserManagement();

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



    userMan.getUserData().then( (results){
      setState(() {
        userData = results;

      });

    }
    );


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
            onPressed: (){

              Map <String, dynamic> userMap = {
                'firstname':firstName,
                'lastname' :  lastName,
                'levelofstudy':levelStudy,
                'institution':institution,
                'faculty': faculty,
              };

              userMan.updateData(userData.documents[0].documentID, userMap);

                Fluttertoast.showToast(msg: "Your profile has been updated" ,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 2,
                    backgroundColor: kReferAccentDark,
                    textColor: Colors.white
                );

              saveDisplayRef(firstName);



            },
          ),

        ],
      ),

      drawer: UIDrawer(),

      body:
      SafeArea(
        child:
            Stack(
                fit: StackFit.expand,
              children: <Widget>[
                ProfileBackground(),
                ProfileFields(
                  onFAValueChanged: (value){ faculty = value;},
                  onINValueChanged: (value){institution= value;},
                  onFNValueChanged: (value){firstName= value;},
                  onLNValueChanged: (value){lastName =value;},
                  onLSValueChanged: (value){levelStudy= value;},
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

class ProfileFields extends StatefulWidget{

  final ValueChangeCallback onFNValueChanged;
  final ValueChangeCallback onLNValueChanged;
  final ValueChangeCallback onLSValueChanged;
  final ValueChangeCallback onINValueChanged;
  final ValueChangeCallback onFAValueChanged;


  ProfileFields({this.onFNValueChanged, this.onLNValueChanged,
      this.onLSValueChanged, this.onINValueChanged, this.onFAValueChanged});

  @override
  _ProfileFieldsState createState() => new _ProfileFieldsState();

}

class _ProfileFieldsState extends State<ProfileFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final studyLevelController = TextEditingController();
  final instController = TextEditingController();
  final facultyController = TextEditingController();
  QuerySnapshot userData;

  UserManagement userMan= new UserManagement();

  @override
  void initState() {
    userMan.getUserData().then( (results){
      setState(() {
        userData = results;
        if(userData!=null){

        firstNameController.text =userData.documents[0].data['firstname'].toString();

        lastNameController.text = userData.documents[0].data['lastname'].toString();
        studyLevelController.text = userData.documents[0].data['levelofstudy'].toString();
        instController.text = userData.documents[0].data['institution'].toString();
        facultyController.text = userData.documents[0].data['faculty'].toString();
        }

        firstNameController.addListener(latestValueListener);
        lastNameController.addListener(latestValueListener);
        studyLevelController.addListener(latestValueListener);
        instController.addListener(latestValueListener);
        facultyController.addListener(latestValueListener);


      });

    }
    );
  }

  latestValueListener(){
    widget.onFNValueChanged(firstNameController.text );
    widget.onLNValueChanged(lastNameController.text);
    widget.onLSValueChanged(studyLevelController.text);
    widget.onINValueChanged(instController.text);
    widget.onFAValueChanged(facultyController.text);
  }

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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

                        TextField(
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
                        TextField(
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
                  TextField(
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
                  TextField(
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
                  TextField(
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
    );//center
  }


}


