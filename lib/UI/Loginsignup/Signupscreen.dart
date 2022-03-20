// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:potofolios/UI/Home/HomePage.dart';
import 'package:potofolios/UI/Loginsignup/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/user_model.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _result;

  String? errorMessage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reppasswordController = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();

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
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Signin',
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
                      key: _formKey,
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
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Text is empty';
                                  }
                                  return null;
                                },
                                controller: usernamecontroller,
                                cursorHeight: 28,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.lightBlue, width: 2.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: 'Username',
                                    labelText: 'Username',
                                    labelStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                              ),
                            ),
                          ),
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Email");
                                  }
                                  // reg expression for email validation
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please Enter a valid email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  emailController.text = value!;
                                },
                                controller: emailController,
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
                                    labelText: 'Email',
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
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.lightBlue.withOpacity(0.35),
                          //           spreadRadius: 1,
                          //           blurRadius: 7,
                          //           offset: Offset(
                          //               0, 3), // changes position of shadow
                          //         ),
                          //       ],
                          //     ),
                          //     height: 50,
                          //     child: TextFormField(
                          //       cursorHeight: 28,
                          //       cursorColor: Colors.blue,
                          //       decoration: InputDecoration(
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //                 color: Colors.lightBlue, width: 2.0),
                          //             borderRadius: BorderRadius.circular(15.0),
                          //           ),
                          //           hintText: 'Gender',
                          //           labelText: 'Gender',
                          //           labelStyle:
                          //               TextStyle(color: Colors.blueGrey),
                          //           filled: true,
                          //           fillColor: Colors.blue[50],
                          //           border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(20.0),
                          //           )),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: screenwidth(context) * .9,
                            child: Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0),
                                      title: const Text(
                                        'Male',
                                        style: TextStyle(),
                                      ),
                                      value: 'Male',
                                      groupValue: _result,
                                      onChanged: (value) {
                                        setState(() {
                                          _result = value;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0),
                                      title: const Text(
                                        'Female',
                                        style: TextStyle(),
                                      ),
                                      value: 'Female',
                                      groupValue: _result,
                                      onChanged: (value) {
                                        setState(() {
                                          _result = value;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0),
                                      title: const Text(
                                        'Others',
                                        style: TextStyle(),
                                      ),
                                      value: 'Others',
                                      groupValue: _result,
                                      onChanged: (value) {
                                        setState(() {
                                          _result = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
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
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Text is empty';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                obscureText: true,
                                obscuringCharacter: '*',
                                cursorHeight: 28,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.lightBlue,
                                    ),
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.lightBlue, width: 2.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                              ),
                            ),
                          ),
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
                                validator: (text) {
                                  if (reppasswordController ==
                                      passwordController) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'Repeat Password is not match with Password');
                                  }
                                },
                                controller: reppasswordController,
                                obscureText: true,
                                obscuringCharacter: "*",
                                cursorHeight: 28,
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.lightBlue,
                                    ),
                                    hintText: 'Repeat Password',
                                    labelText: 'Repeat Password',
                                    labelStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    filled: true,
                                    fillColor: Colors.blue[50],
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.lightBlue, width: 2.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
                              ),
                            ),
                          )
                        ],
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
                                builder: (context) => const HomePage()));
                        // signUp(emailController.text, passwordController.text);
                      },
                      child: Container(
                        width: screenwidth(context) / 1.1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 15, bottom: 15, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign In',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account? '),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: Text(
                          'LogIn',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernamecontroller.text;
    userModel.gender = _result;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
