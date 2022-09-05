import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pebbl_life/screen/sign.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        width: widthscreen,
        height: heightscreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 80,
            //   width: 50,
            //   child: SvgPicture.asset(
            //       "assets/images/welcome.svg" //just like you define in pubspec.yaml file

            //       ),
            // ),
            Container(
              width: 300,
              height: 300,
              // width: widthscreen * 0.750,
              // height: heightscreen * 0.350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/welcome.png"),
              )),
            ),
            SizedBox(
              height: heightscreen * 0.20,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeSign())),
              child: Container(
                height: 80.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.deepPurpleAccent,
                          Colors.deepPurpleAccent,

                          // Colors.red,
                          // Colors.indigo,
                          // Colors.teal,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeSign())),
              child: Container(
                height: 80.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.white,
                          Colors.white,

                          // Colors.red,
                          // Colors.indigo,
                          // Colors.teal,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
