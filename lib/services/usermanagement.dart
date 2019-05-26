import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/widgets.dart';

class UserManagement{

  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser()!=null){
      return true;
    }else{
      return false;
    }
  }


  storeNewUser(user, context){
    Firestore.instance.collection('users').add({
      'firstname': "",
      'lastname' : "",
      'levelofstudy':"",
      'institution':"",
      'faculty': "",
      'email': user.email,
      'uid':user.uid
    }). then((DocumentReference docref){
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/landing');
    }).catchError((e){
      print(e);
    });
  }


  storeNewUserGoogle(user, context){

    Firestore.instance.collection('users').add({
      'firstname': user.displayName,
      'lastname' : "",
      'levelofstudy':"",
      'institution':"",
      'faculty': "",
      'email': user.email,
      'uid':user.uid
    }). then((DocumentReference docref){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/landing');
    }).catchError((e){
      print(e);
    });
  }

  getUserData() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return await Firestore.instance.collection('users').where('uid', isEqualTo:user.uid ).getDocuments();
  }

  getGoogleUserData() async{


   GoogleSignIn _googleSignIn = new GoogleSignIn();
    GoogleSignInAccount currentUser = await _googleSignIn.currentUser;
    print("uid ${currentUser.id}");
  //  FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return await Firestore.instance.collection('users').where('uid', isEqualTo:currentUser.id ).getDocuments();
  }


   checkGoogleUser(user) async{
     return await Firestore.instance.collection('users').where('uid', isEqualTo:user.uid ).getDocuments();

   }

  updateData(selectedDoc, newValues){
    if(isLoggedIn()){
      Firestore.instance.collection('users').document(selectedDoc).updateData(newValues).catchError((e){print(e);});
    }

    
  }


  deleteData(docId){
    Firestore.instance.collection('users').document(docId).delete().catchError((e){print(e);});
  }

  
}