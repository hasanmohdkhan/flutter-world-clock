import 'package:flutter/material.dart';
import 'package:world_app/service/world_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  setUpWorldTime() async {
    WorldTime world =
    new WorldTime(location: 'India', flag: "india.png", url: 'Asia/Kolkata');
    await world.getTime();
    print('WORLD: ${world.time} ');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': world.location,
      'time': world.time,
      'flag': world.flag,
      'isDayTime': world.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: Center(
        child:  SpinKitFadingCube(
          color: Colors.white,
          size: 100.0,
        ),
        ));
  }
}
