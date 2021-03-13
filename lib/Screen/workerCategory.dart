import 'package:flutter/material.dart';
import 'package:freelancekisan_user/main.dart';

// ignore: camel_case_types
class WorkerCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select worker Category'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card_widget(textName: 'Electrician'),
          Card_widget(textName: 'Raj Mistry'),
          Card_widget(textName: 'Plumber'),
          Card_widget(textName: 'Farm Worker'),

        ],
      ),
    );
  }
}

class Card_widget extends StatelessWidget {
  String textName;
  Card_widget({this.textName});


  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Center(
        child: Card(
        child: InkWell(

        splashColor: Colors.greenAccent.withAlpha(80),
        onTap: () {
          print('Card tapped.');
        },
        child:  SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(
            '$textName'
          )),
        ),
        ),
      )
      ),
    );
  }
}
