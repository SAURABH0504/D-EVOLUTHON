import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Model/Profile/FarmerProfile.dart';
import 'package:freelancekisan_user/Model/Profile/NonFarmerProfile.dart';
import 'package:freelancekisan_user/Service/UserService.dart';

FarmerProfile farmerProfile= FarmerProfile();
NonFarmerProfile nonfarmerProfile = NonFarmerProfile();

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
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(text: "Farmer"),Tab(text: "Non Farmer"),
              ],
            ),
            title: Text("Add Details"),

          ),
          body: TabBarView(
            children: [ farmer(),nonfarmer()
            ],
          ),
        )
      ),
    );
  }
}

Widget FormField(BuildContext context,String key,String object)
{
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
      onChanged: (value) {
        switch(object){
          case 'FirstName':{
           farmerProfile.firstName=value;
           break;
          }
          case 'LastName':{
            farmerProfile.lastName=value;
            break;
          }
          case 'ContactNumber':{
            farmerProfile.contactNumber=value;
            break;
          }
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText:key,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
      ),
    ),
  );
}
Widget FormField2(BuildContext context,String key,String object)
{
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: TextFormField(
      onChanged: (value) {
        switch(object){
          case 'FirstName':{
            nonfarmerProfile.firstName=value;
            break;
          }
          case 'LastName':{
            nonfarmerProfile.lastName=value;
            break;
          }
          case 'ContactNumber':{
            nonfarmerProfile.contactNumber=value;
            break;
          }
          case 'Occupation':{
            nonfarmerProfile.occupation=value;
          }
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText:key,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
      ),
    ),
  );
}
class nonfarmer extends StatefulWidget {
  @override
  _nonfarmerState createState() => _nonfarmerState();
}


class _nonfarmerState extends State<nonfarmer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormField2(context, 'First Name', 'FirstName'),
              FormField2(context, 'Last Name', 'LastName'),
              FormField2(context, 'Contact Number', 'ContactNumber'),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1,
                    ),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text(nonfarmerProfile.dob==null?"Select DOB":"DOB: "+nonfarmerProfile.dob),
                    IconButton(icon: Icon(Icons.calendar_today_outlined),onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime(2001), firstDate: DateTime(1949), lastDate: DateTime(2222))
                          .then((value){
                        setState(()
                        {
                          String db=value.toString();
                          db=db.substring(0,10);
                          nonfarmerProfile.dob=db;
                        });
                      });
                    },),],),
                ),
              ),
              FormField2(context, 'Occupation', 'Occupation'),

              TextButton(onPressed: (){
                if(nonfarmerProfile.firstName==null || nonfarmerProfile.lastName==null || nonfarmerProfile.contactNumber==null)
                  {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Please Fill Data')));
                  }
                else
                  {
                    FirebaseAuth auth=FirebaseAuth.instance;
                    nonfarmerProfile.userEmail=auth.currentUser.email;
                    nonfarmerProfile.userId=auth.currentUser.uid;
                    UserService user=UserService();
                    user.saveNonFarmerDetails(nonfarmerProfile);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing')));
                    Navigator.pushNamed(context, '/HomeScreen');
                  }
              },child: Text(
                  "Save Data"
              ), )
            ],
          ),
        ),
      ),
    );
  }
}

class farmer extends StatefulWidget {
  @override
  _farmerState createState() => _farmerState();
}

class _farmerState extends State<farmer> {
  @override
  Widget build(BuildContext context) {
    List farmtype=["Poetry Farm","Agriculture Farm"];
    List land=["Below 10 Acre","Above 10 Acre"];
    return SingleChildScrollView(
      child: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormField(context, 'First Name', 'FirstName'),
              FormField(context, 'Last Name', 'LastName'),
              FormField(context, 'Contact Number', 'ContactNumber'),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1,
                  ),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text(farmerProfile.dob==null?"Select DOB":"DOB: "+farmerProfile.dob),
                    IconButton(icon: Icon(Icons.calendar_today_outlined),onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime(2001), firstDate: DateTime(1949), lastDate: DateTime(2222))
                          .then((value){
                        setState(()
                        {
                          String db=value.toString();
                          db=db.substring(0,10);
                          farmerProfile.dob=db;
                        });
                      });
                    },),],),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text("Select Farm Type"),
                    value: farmerProfile.farmType,
                    onChanged: (value){
                      setState(() {
                        farmerProfile.farmType=value;
                      });
                    },
                    items: farmtype.map((e) {return DropdownMenuItem(value: e,child: Text(e));}).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton(
                    hint: Text("Select Cultivated Land"),
                    value: farmerProfile.cultivatedLand,
                    isExpanded: true,
                    onChanged: (value){
                      setState(() {
                        farmerProfile.cultivatedLand=value;
                      });
                    },
                    items: land.map((e) {return DropdownMenuItem(value: e,child: Text(e));}).toList(),
                  ),
                ),
              ),
              TextButton(onPressed: (){
                if(farmerProfile.firstName==null || farmerProfile.lastName==null || farmerProfile.contactNumber==null)
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Please Fill Data')));
                }
                else{
                  FirebaseAuth auth = FirebaseAuth.instance;
                  farmerProfile.userEmail = auth.currentUser.email;
                  farmerProfile.userId = auth.currentUser.uid;
                  UserService user=UserService();
                  user.saveFarmerDetails(farmerProfile);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing')));
                  Navigator.pushNamed(context, '/HomeScreen');
                }
                },child: Text(
                  "Save Data"
              ), )
            ],
          ),
        ),
      ),
    );
  }
}