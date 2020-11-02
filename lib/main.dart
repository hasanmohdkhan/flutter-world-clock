import 'package:flutter/material.dart';
import 'package:world_app/pages/choose_location.dart';
import 'package:world_app/pages/home.dart';
import 'package:world_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'World Clock',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/' /* For testing only */,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
