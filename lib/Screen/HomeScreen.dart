import 'package:flutter/material.dart';
import 'package:freelancekisan_user/Service/AuthService.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: TextButton(
          child: Text('LogOut'),
          onPressed: ()
          {
            AuthService().signOut();
          },
        ),
      ),
    );
  }
}
