import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snake_app/pages/details.dart';
import 'package:snake_app/pages/home.dart';
import 'package:snake_app/pages/snakes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      routes:{
        "/":(context) => Home(),
        "/details":(context) => Details(),
        "/snakes":(context) => Snakes()
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
