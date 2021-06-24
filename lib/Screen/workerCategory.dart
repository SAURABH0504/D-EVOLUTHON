import 'package:flutter/material.dart';

// ignore: camel_case_types
class WorkerCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select worker Category'),
      ),
      body: Container(
        child: GridView.count(
          mainAxisSpacing: 3,
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          children: [
            Card_widget(textName: 'Electrician'),
            Card_widget(textName: 'Raj Mistry',),
            Card_widget(textName: 'Plumber'),
            Card_widget(textName: 'Farm Worker'),
          ],
        ),
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
          color: Colors.green.shade400,
        child: InkWell(

        splashColor: Colors.greenAccent.withAlpha(80),
        onTap: () {
          print('Card tapped.');
        },
        child:  SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(
            '$textName',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
          )),
        ),
        ),
      )
      ),
    );
  }
}
