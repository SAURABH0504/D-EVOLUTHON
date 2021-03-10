import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelancekisan_user/Screen/HomeScreen.dart';
import 'package:freelancekisan_user/Screen/LoginSignUp.dart';
import 'package:freelancekisan_user/Screen/ProfileScreen.dart';

class AuthService{
  FirebaseAuth firebase = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){
            return ProfileScreen();
          } else {
            print('2');
            return LoginSignUp();
          }
        });
  }
  signOut() {
    FirebaseAuth.instance.signOut();
  }
  //SignIn
  signIn(AuthCredential authCreds){
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }
}