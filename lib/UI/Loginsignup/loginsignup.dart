// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:potofolios/UI/Loginsignup/Signupscreen.dart';
import 'package:potofolios/UI/Loginsignup/loginscreen.dart';

class Loginsignup extends StatefulWidget {
  const Loginsignup({Key? key}) : super(key: key);

  @override
  _LoginsignupState createState() => _LoginsignupState();
}

class _LoginsignupState extends State<Loginsignup> {
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 220.0,
                      left: 120,
                      bottom: 40,
                    ),
                    child: Row(
                      children: [Image(image: AssetImage('assets/logo.png'))],
                    ),
                  ),
                  Text(
                    'PortFolios',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Cursive',
                      fontWeight: FontWeight.w900,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(
                    height: screenheight(context) / 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: Container(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 20, bottom: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'times new roman',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(colors: [
                          //   Color(0xFF64b3f4),
                          //   Color(0xFF64b3f4),
                          //   Color(0xFFf2facd),
                          // ]),
                          color: Colors.lightBlue,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()));
                      },
                      child: Container(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'times new roman',
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                  )

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: Text(
                  //     'Signin',
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontFamily: 'times new roman',
                  //         color: Colors.blue),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: Form(
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.lightBlue.withOpacity(0.2),
                  //                   spreadRadius: 1,
                  //                   blurRadius: 7,
                  //                   offset: Offset(
                  //                       0, 3), // changes position of shadow
                  //                 ),
                  //               ],
                  //             ),
                  //             height: 50,
                  //             child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: Colors.lightBlue, width: 2.0),
                  //                     borderRadius: BorderRadius.circular(15.0),
                  //                   ),
                  //                   hintText: 'Username',
                  //                   labelText: 'Username',
                  //                   labelStyle:
                  //                       TextStyle(color: Colors.blueGrey),
                  //                   filled: true,
                  //                   fillColor: Colors.blue[50],
                  //                   border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(10.0),
                  //                   )),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.lightBlue.withOpacity(0.2),
                  //                   spreadRadius: 1,
                  //                   blurRadius: 7,
                  //                   offset: Offset(
                  //                       0, 3), // changes position of shadow
                  //                 ),
                  //               ],
                  //             ),
                  //             height: 50,
                  //             child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: Colors.lightBlue, width: 2.0),
                  //                     borderRadius: BorderRadius.circular(15.0),
                  //                   ),
                  //                   hintText: 'Email',
                  //                   filled: true,
                  //                   labelText: 'Email',
                  //                   labelStyle:
                  //                       TextStyle(color: Colors.blueGrey),
                  //                   focusColor: Colors.blue,
                  //                   fillColor: Colors.blue[50],
                  //                   border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(10.0),
                  //                   )),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.lightBlue.withOpacity(0.2),
                  //                   spreadRadius: 1,
                  //                   blurRadius: 7,
                  //                   offset: Offset(
                  //                       0, 3), // changes position of shadow
                  //                 ),
                  //               ],
                  //             ),
                  //             height: 50,
                  //             child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: Colors.lightBlue, width: 2.0),
                  //                     borderRadius: BorderRadius.circular(15.0),
                  //                   ),
                  //                   hintText: 'Gender',
                  //                   labelText: 'Gender',
                  //                   labelStyle:
                  //                       TextStyle(color: Colors.blueGrey),
                  //                   filled: true,
                  //                   fillColor: Colors.blue[50],
                  //                   border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(10.0),
                  //                   )),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.lightBlue.withOpacity(0.2),
                  //                   spreadRadius: 1,
                  //                   blurRadius: 7,
                  //                   offset: Offset(
                  //                       0, 3), // changes position of shadow
                  //                 ),
                  //               ],
                  //             ),
                  //             height: 50,
                  //             child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   hintText: 'Password',
                  //                   labelText: 'Password',
                  //                   labelStyle:
                  //                       TextStyle(color: Colors.blueGrey),
                  //                   filled: true,
                  //                   fillColor: Colors.blue[50],
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderSide: const BorderSide(
                  //                         color: Colors.lightBlue, width: 2.0),
                  //                     borderRadius: BorderRadius.circular(15.0),
                  //                   ),
                  //                   border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(10.0),
                  //                   )),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ));
  }
}
