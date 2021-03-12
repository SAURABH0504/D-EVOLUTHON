

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Model/Profile/FarmerProfile.dart';

FarmerProfile farmerProfile= FarmerProfile();


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
FirebaseAuth auth_profile = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {




    return Scaffold(

      body:DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Farmer"),Tab(text: "Non Farmer"),
              ],
            ),
            title: Text("Add Details"),

          ),
          body: TabBarView(
            children: [ farmer(context),farmer(context)

            ],
          ),
        )
      ),
    );
  }
}


Widget farmer(BuildContext context){
  return Center(
    child: Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              farmerProfile.firstName = value;

            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText:'First Name',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              farmerProfile.lastName = value;

            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText:'Last Name',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              farmerProfile.contactNumber = value;

            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText:'Phone No',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/HomeScreen');
          },child: Text(
              "Save Data"
          ), )
        ],
      ),
    ),
  );
}
