

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:referease/shared_preference/sharedpreference.dart';
import 'package:referease/services/usermanagement.dart';
import 'package:referease/uipage/source/sourcelist.dart';
import 'package:referease/uipage/summary/summarylist.dart';

class UIDrawer extends StatefulWidget{


  @override
  _UIDrawerState createState()=> new _UIDrawerState();

}

class _UIDrawerState extends State<UIDrawer> {

  FirebaseUser _currentUser;

  String currentUser_uid ;

  String email ="";
  String displayname="";

  QuerySnapshot userData;
  UserManagement userMan= new UserManagement();

  getUserData() async{
    _currentUser = await FirebaseAuth.instance.currentUser();
   // print("drawer ${_currentUser.uid}");

    setState(() {
      email = _currentUser.email;
     // displayname = _currentUser.displayName;
    });

    try{

      userMan.getUserData().then((results){
        setState(() {
          userData = results;
          if(userData!=null){
            String name = userData.documents[0].data['firstname'].toString() ;
            name.isNotEmpty? displayname=name: displayname ="";
          }
        });
      });



    }catch(e){
      displayname ="";
      print(e.toString());
    }

  }


  getSavePrefUserData() async{
    currentUser_uid = await SharedPreferencesUtils.getUserUID();

   String  em = await SharedPreferencesUtils.getUserEmail();
    String dn= await SharedPreferencesUtils.getUserDisplayName();


    setState(() {
      email =em;
      displayname = dn;
    });


  }

  @override
  void initState() {
  //  getUserData();
    getSavePrefUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("${email}"),
            accountName: Text("${displayname}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/refereasylogo.png"), backgroundColor: Colors.white,
            ),//circleavartar
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: new Image(
                  image: AssetImage("assets/images/edit.png"),height: 20,width: 20,
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/profile');
                },
              ),
            ],//widget
            decoration: new BoxDecoration(
                image: new DecorationImage(
                 //   image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                   image: AssetImage("assets/images/background_hoz.jpg"),
                    fit: BoxFit.fill
                )
            ),
          ),//account header
          new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/landing');
               // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
              }
          ),
          new ListTile(
              title: new Text("My Summaries"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
             //   Navigator.of(context).popAndPushNamed('/summarylist');
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) =>SummaryList(currentUser_uid:currentUser_uid ,)));
              }
          ),
          new ListTile(
              title: new Text("My Sources"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
               // Navigator.of(context).popAndPushNamed('/sourcelist');
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) =>SourceList(currentUser_uid:currentUser_uid ,)));

              }
          ),
         /* new ListTile(
              title: new Text("My Authors"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/pageview');                //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
              }
          ),*/
          new Divider(),
          new ListTile(
            title: new Text("How to Refer Easy"),
            trailing: new Icon(Icons.bug_report),
            onTap: (){
              Navigator.of(context).popAndPushNamed('/support');
            },
          ),
          new ListTile(
            title: new Text("About"),
            trailing: new Icon(Icons.priority_high),
            onTap: (){
              Navigator.of(context).popAndPushNamed('/about');
            },
          ),
          new ListTile(
            title: new Text("Sign Out"),
            trailing: new Icon(Icons.cancel),
            onTap: (){
              FirebaseAuth.instance.signOut().then((value){
                Navigator.of(context).pushReplacementNamed('/login');
              }).catchError((e){print(e);});
            },
          ),
        ],







      ),//listview

    );//drawer
  }
}