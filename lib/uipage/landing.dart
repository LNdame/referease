import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:referease/commonwidget/drawerwidget.dart';
import 'package:referease/model/source.dart';
import 'package:referease/services/sharedpreference.dart';
import 'package:referease/services/usermanagement.dart';
import 'package:referease/uipage/search/help.dart';
import 'package:referease/uipage/source/addsource.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'summary/summarydetail.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';


class LandingPage extends StatefulWidget{



  @override
  _LandingPageState createState() {
    return new _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
 // MenuController _menuController;
  FirebaseUser _currentUser;
  String _connectivityStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;


  File sampleImage;

  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }


  getUserData() async{

    if(await SharedPreferencesUtils.getisFirstLaunch() ){

      _currentUser = await FirebaseAuth.instance.currentUser();

      String name="";
      try{
        UserManagement userMan= new UserManagement();
        userMan.getUserData().then((results){
          results;
          if(results!=null){
            name = results.documents[0].data['firstname'].toString() ;
          }
        });

      }catch(e){
        print(e.toString());
      }
      await SharedPreferencesUtils.setUserUid(_currentUser.uid);
      await SharedPreferencesUtils.setUserDisplayName(name);
      await SharedPreferencesUtils.setUserEmail(_currentUser.email);

      await SharedPreferencesUtils.setisFirstLaunch(false);

    }



  }


  @override
  void dispose() {
    // TODO: implement dispose
    _connectivitySubscription.cancel();
    super.dispose();

  }

  @override
  void initState() {
   // _menuController = MenuController(vsync: this);
    super.initState();
   /* initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result){
      setState(()=> _connectivityStatus = result.toString());
    });*/

    getUserData();


  }


  Future<Null> initConnectivity() async{
    String connectionStatus;

    try{
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch(e){
      print(e.toString());
      connectionStatus = 'Failed to get connectivity';
    }


    if(!mounted){ return;}

    setState(() {
      _connectivityStatus = connectionStatus;
    });
  }





  Widget iconSection = Container(
    padding:  const EdgeInsets.all(32.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/refereasylogo.png", height: 150.0,),
        ],
    ),//row

  );//container iconSection

  Future<Null> openDialog() async{
    switch(
    await showDialog(context: context,

          builder: (BuildContext context){
            return SimpleDialog(
                  contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
              children: <Widget>[
                Container(
                  color: kReferPrimary,
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.wpforms,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(bottom: 10.0),
                      ),
                      Text(
                        'Summary type',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please select the type of summary',
                        style: TextStyle(color: Colors.white70, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),//container

                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 0);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.cogs,
                          color: kReferAccent,
                        ),
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        'Reflect',
                        style: TextStyle(
                            color: kReferAccent, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),//simpledialogoption

                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon( FontAwesomeIcons.commentDots,
                          color: kReferAccent,
                        ),
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        'Discuss',
                        style: TextStyle(
                            color: kReferAccent, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

              ],//children
            );//simpleDialog
          }//builder

    )//showdialog


    ){
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SummaryDetail(type:"reflect"),) );
        break;
      case 1:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SummaryDetail(type:"discuss"),) );
      break;

    }
  }



  Future<Null> sourceOpenDialog() async{
    switch(
    await showDialog(context: context,

        builder: (BuildContext context){
          return SimpleDialog(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kReferPrimary,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        FontAwesomeIcons.braille,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Source type',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please select the type of source',
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),//container

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.public,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Book',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialogoption

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.description,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Conference Proceeding',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog

              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.import_contacts,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Journal Article',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog


              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 3);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon( Icons.public,
                        color: kReferAccent,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'Web',
                      style: TextStyle(
                          color: kReferAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),//simpledialog

            ],//shildren
          );//simpleDialog
        }//builder

    )//showdialog


    ){
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSource(sourceType:SourceType.book),) );
        break;
      case 1:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.conference_proceeding),) );
      break;
      case 2:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.journal_article),) );
      break;
      case 3:  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSource(sourceType:SourceType.web),) );
      break;

    }
  }




  Widget buttonSection (BuildContext context)=> Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                //Navigator.of(context).pushNamed('/summarydetail');
                openDialog();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/triangle.png", height: 80.0,width: 80.0,),
                  Container(
                    margin: EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: Text("Start Summary", style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: kReferPrimaryAltText
                    ),) ,
                  )
                ],

              ),
            ),//column

            GestureDetector(
              onTap: (){
               // Navigator.of(context).pushNamed('/addsource');
                sourceOpenDialog();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/circle.png", height: 80.0,width: 80.0,),
                  Container(
                    margin: EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: Text("New Source", style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: kReferPrimaryAltText
                    ),) ,
                  )
                ],

              ),//column
            ),//gesture




          ],
        ), //end row
      ) ,

  ); //container button section


  Widget enableUpload(){
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0,width: 300.0,),
          RaisedButton(
            elevation: 7.0,
            child: Text("upload"),
            textColor:  Colors.white,
            color: Colors.blue,
            onPressed: () {
               StorageReference storageRef = FirebaseStorage.instance.ref().child('myimage.jpg');

               StorageUploadTask task = storageRef.putFile(sampleImage);
            },
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
          appBar:AppBar(
            brightness: Brightness.light,
            title: Text(''),
            elevation: 0.0,

           backgroundColor:kReferBackgroundWhite ,
           /* IconButton(
                icon:Icon(Icons.menu,semanticLabel: 'menu',),

                onPressed: (){
                  _menuController.openMenu(true);
                  print('Menu button');
                }),*/

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, semanticLabel: 'search',),
                onPressed: (){
                 Navigator.pushReplacementNamed(context, '/search');
                },
              ),
              IconButton(
                icon: Icon(Icons.help_outline, semanticLabel: 'help',),
                onPressed: (){
                 // Navigator.pushReplacementNamed(context, '/help');

                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Help(1),) );

                },
              ),
            ],
          ),

          drawer: UIDrawer(),
         body:

             Container(
               decoration: new BoxDecoration(
                 image:DecorationImage(image: AssetImage("assets/images/doodlebg.jpg"),
                 fit: BoxFit.cover)

               ),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    iconSection,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Refer Easy',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)
                        ),

                      ],
                    ),
                   // Text('Connection status: $_connectivityStatus'),
                    Expanded(flex: 2 ,child: Container(),),
                    buttonSection(context),
           ],

         ),
             ),




         /* body: Center(

            child: Column(
              children: <Widget>[
                Text("Landing"),

                RaisedButton(
                  child: Text("Log Out"),
                  onPressed: (){
                    FirebaseAuth.instance.signOut().then((value){
                      Navigator.of(context).pushReplacementNamed('/login');
                    }).catchError((e){print(e);});
                  },
                ),
                sampleImage ==null? Text('select an image'): enableUpload(),

              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Change profile image',
          child: Icon(Icons.camera),
          onPressed: getImage,
      )
*/

    );






  }
}

