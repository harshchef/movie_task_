import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pebbl_life/screen/login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(
      _duration,
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Container(
      // width: 300,
      // height: 300,
      width: widthscreen * 0.50,
      height: heightscreen * 0.50,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/welcome.png"),
      )),
    );
  }
}
