import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    String userName = await Future.delayed(Duration(seconds: 3), () {
      return 'Hasan';
    });
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Learning Flutter';
    });

    print('User Name : $userName \nBio: $bio');
  }

  @override
  void initState() {
    super.initState();
    print('init state runs');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build runs');
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: RaisedButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: Text('counter $counter')));
  }
}
