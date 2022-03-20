// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  screenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  screenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/des.png',
                      ),
                      width: screenwidth(context),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      color: Colors.white.withOpacity(0.9),
                      colorBlendMode: BlendMode.modulate,
                      image: AssetImage('assets/bg_bottom.png'),
                      height: 75,
                      width: 150,
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 110.0, bottom: 10, left: 40),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/logo.png',
                          ),
                          width: 90,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'times new roman',
                          color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlue.withOpacity(0.35),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 50,
                              child: TextFormField(
                                cursorHeight: 28,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.lightBlue, width: 2.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: 'example@gmail.com',
                                    filled: true,
                                    labelText: 'Enter Your Email',
                                    labelStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    focusColor: Colors.blue,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: screenwidth(context) / 1.1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 15, bottom: 15, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'times new roman',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(colors: [
                          //   Colors.lightBlue,
                          //   Colors.lightBlue,
                          //   Colors.yellowAccent,
                          // ]),
                          color: Colors.lightBlue[600],
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlue.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
