import 'package:flutter/material.dart';

import '../constants.dart';

class  MovieCard extends StatelessWidget {


        final String name;
  final String img;
  final String dirname;
  MovieCard({


    this.dirname,
    this.img,
    this.name
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), //or 15.0
                  child: Container(
                    height: 95.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Event:- " + dirname),
                      Text("Date:- " + name),
                      Text("Time:- " + img),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}