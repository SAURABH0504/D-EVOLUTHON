import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Screen/HomeScreen.dart';
import 'package:freelancekisan_user/Screen/LoginSignUp.dart';
import 'package:freelancekisan_user/Screen/ProfileScreen.dart';
import 'package:freelancekisan_user/Service/UserService.dart';

class AuthService{
  FirebaseAuth firebase = FirebaseAuth.instance;

  handleAuth(){

    return StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData){
            return FutureBuilder(builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                if(snapshot.data==true)
                  {
                    return HomeScreen();
                  }
                else
                  {
                    print(snapshot.data);
                    return ProfileScreen();
                  }
              }
              if (snapshot.connectionState == ConnectionState.waiting){
                return Container(color: Colors.white,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.green,)));
              }
              return Container();
            }, future: checkProfile(),);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(color: Colors.white,child: Center(child: CircularProgressIndicator()));
          }
          else {
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
  Future<bool> checkProfile()async{
    FirebaseAuth auth =FirebaseAuth.instance;
    UserService user=UserService();
    bool check = await user.checkProfile(auth.currentUser.uid);
    return check;
  }
}