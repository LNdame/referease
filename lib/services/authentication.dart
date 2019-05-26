import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:referease/services/sharedpreference.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async{

  //attempt to get teh currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if(currentUser==null){
    //attempt to sign in without user interaction
    currentUser = await _googleSignIn.signInSilently();
  }

  if(currentUser==null){
    //force the user to interactively sign in
    currentUser = await _googleSignIn.signIn();
  }


  final GoogleSignInAuthentication auth = await currentUser.authentication;

  //authenticate with firebase
  final FirebaseUser user= await _auth.signInWithGoogle(idToken: auth.idToken,
      accessToken: auth.accessToken,);

  assert(user!=null);
  assert(!user.isAnonymous);

  ///save into shared preference
  await SharedPreferencesUtils.setUserUid(user.uid);
  await SharedPreferencesUtils.setUserDisplayName(user.displayName);
  await SharedPreferencesUtils.setUserEmail(user.email);

  return user;

}

Future<Null> signOutWithGoogle() async {
  //sign out with firebase
  await _auth.signOut();
  //sign out with google
  await _googleSignIn.signOut();
}