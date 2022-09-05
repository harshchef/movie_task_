import 'package:flutter/material.dart';

import 'package:pebbl_life/screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pebbl.life",
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.white, //<-- SEE HERE
      // ),
      home: SplashScreen(),
      routes: {},
    );
  }
}
