// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:potofolios/UI/Home/HomePage.dart';
import 'package:potofolios/UI/Loginsignup/forgetpassword.dart';

import 'Signupscreen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  screenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  screenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

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
                      'LogIn',
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
                                controller: emailController,
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
                                textInputAction: TextInputAction.next,
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
                                controller: passwordController,
                                obscureText: true,
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("Password is required for login");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Enter Valid Password(Min. 6 Character)");
                                  }
                                },
                                onSaved: (value) {
                                  passwordController.text = value!;
                                },
                                textInputAction: TextInputAction.done,
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
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Forgot()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text('Forget Password?'),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                        // signIn(emailController.text, passwordController.text);
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
                                'Log In',
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
                      Text('Register a New Account? '),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Signup()));
                        },
                        child: Text(
                          'SignIn',
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
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
        print(error.code);
      }
    }
  }
}
