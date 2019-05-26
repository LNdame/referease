import 'package:flutter/material.dart';
import 'package:referease/uiutility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  String name=""; String imageUrl= "";

  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount= await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;

    FirebaseUser user= await _auth.signInWithGoogle(idToken: gsa.idToken,
        accessToken: gsa.accessToken);

    setState(() {
      name = user.displayName;
      imageUrl = user.photoUrl;

    });

    _alertDialog();
    print("Logged user : ${user.displayName}");
    return user;

  }


  final _usernameController = new TextEditingController();
  final _passwordController = TextEditingController();


  void _alertDialog(){
    AlertDialog alertDialog = new AlertDialog(
      contentPadding: EdgeInsets.all(8.0),
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("New Login",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            ),//text
          new Divider(),
        ClipOval(child: Image.network(imageUrl)),
            Text("Logged in as $name", style: TextStyle(fontSize: 16.0,color: Colors.black),),

            RaisedButton(
              child: Text("Continue"),
              onPressed: ()=>Navigator.popAndPushNamed(context, '/landing'),
            ),
          ],
        ),//column
      ) ,
    );

    showDialog(context: context, child: alertDialog);
  }


  void signOut(){
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
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
                  onPressed: ()=>_signIn().then((FirebaseUser user)=>print(user)),
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
