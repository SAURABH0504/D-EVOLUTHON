import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('Your Profile'),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            ),
            ListTile(
              title:Text('Previous Transaction'),
              onTap: (){

              },
            ),
            ListTile(
              title:Text('Rating'),
              onTap: (){

              },
            ),
            ListTile(
              title:Text('Logout'),
              onTap: (){
                AuthService().signOut();
              },
            ),

          ],
        ),
      ),
    );
  }
}
