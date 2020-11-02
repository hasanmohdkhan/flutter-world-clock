import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // empty variable for incoming data from loading screen
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // getting data send from loading screen
    data = ModalRoute.of(context).settings.arguments;

    print('data from  : $data');

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(children: [
          FlatButton.icon(
            label: Text('Choose Location'),
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.location_pin),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Text(data['time'],
              style: TextStyle(fontSize: 66.0, letterSpacing: 1.0,))
        ]),
      )),
    );
  }
}
