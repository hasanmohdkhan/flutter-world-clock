import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        FlatButton.icon(
          label: Text('Choose Location'),
          onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
          icon: Icon(Icons.location_pin),
        )
      ])),
    );
  }
}
