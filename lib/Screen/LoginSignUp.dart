import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  String email;
  String password;
  FirebaseAuth auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  Widget _getPassword() {
    return Column(
      children: [
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: Colors.green.shade700)),
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.black,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            }
            return null;
          },
          onChanged: (String value) {
            setState(() {
              password = value;
            });
          },
        ),
      ],
    );
  }
  Widget _getEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Colors.green.shade700)),
      cursorColor: Colors.black,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          email = value;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login Below',style: TextStyle(color: Colors.green.shade800,fontSize: 25),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(key: _formKey2,child: Column(
                  children: [
                    _getEmail(),
                    _getPassword(),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.symmetric(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      child: Column(
                        children: [
                          Text('Sign In',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      onPressed: (){
                        if (!_formKey2.currentState.validate()) {
                          return;
                        }
                        else
                          {
                            int k=0;
                            auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
                              AuthService().signIn(value.credential);
                              Fluttertoast.showToast(
                                  msg: "Signed Up",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                            ).onError((error, stackTrace) {
                                  print(error.toString());
                                  if(error.toString()=="[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.")
                                    {
                                      print('Sign Up First');
                                      Fluttertoast.showToast(
                                          msg: "No Account Sign Up First",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                  if(error.toString()=="[firebase_auth/wrong-password] The password is invalid or the user does not have a password.")
                                  {
                                    print('Password Wrong');
                                    Fluttertoast.showToast(
                                        msg: "Password Wrong",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                }
                                );
                          }
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.symmetric(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      child: Column(
                        children: [
                          Text('Sign Up',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      onPressed: ()async{
                        if (!_formKey2.currentState.validate()) {
                          return;
                        }
                        else
                          {
                            await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
                              Navigator.pushNamed(context, 'ProfileScreen');
                            }).onError((error, stackTrace){
                              if(error.toString()=="[firebase_auth/weak-password] Password should be at least 6 characters")
                                {
                                  Fluttertoast.showToast(
                                      msg: "Please Enter 6 Digit Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                              if(error.toString()=="[firebase_auth/email-already-in-use] The email address is already in use by another account.")
                              {
                                Fluttertoast.showToast(
                                    msg: "Email Already Exist",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            });
                          }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
