// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_call_super

import 'dart:async';

import 'package:flutter/material.dart';

import 'Loginsignup/loginsignup.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

screenwidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

screenheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class _SplashscreenState extends State<Splashscreen> {
  final splashDelay = 7;

  @override
  void initState() {
    super.initState;
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Loginsignup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8fff8),
      body: InkWell(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 200,
                    image: AssetImage('assets/logo.png'),
                  ),
                  Text(
                    'PortFolio',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'cursive',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ],
              ),
              height: screenheight(context),
              width: screenwidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.cyanAccent.withOpacity(0.2), BlendMode.color),
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/signinsignupbg.jpg'))),
            ),
          ],
        ),
      ),
    );
  }
}
