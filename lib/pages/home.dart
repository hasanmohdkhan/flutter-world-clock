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
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set bg images
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color textColor = data['isDayTime'] ? Colors.white : Colors.white;

    print('data from  : $data');

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(children: [
            FlatButton.icon(
              label:
                  Text('Choose Location', style: TextStyle(color: textColor)),
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'time': result['time'],
                    'flag': result['flag'],
                    'isDayTime': result['isDayTime']
                  };
                });
              },
              icon: Icon(Icons.location_pin, color: textColor),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius : 25,
                  backgroundImage: AssetImage('assets/${data['flag']}')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: textColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 55.0),
            Text(data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  letterSpacing: 1.0,
                  color: textColor,
                ))
          ]),
        ),
      )),
    );
  }
}
