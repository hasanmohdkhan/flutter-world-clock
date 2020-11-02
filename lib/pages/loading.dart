import 'package:flutter/material.dart';
import 'package:world_app/service/world_service.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  setUpWorldTime() async {
    World world =
        new World(location: 'India', flag: "india.png", url: 'Asia/Kolkata');
    await world.getTime();
    print('WORLD: ${world.time} ');

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': world.location,
      'time': world.time,
      'flag': world.flag
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
        body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text('$time'),
    ));
  }
}
