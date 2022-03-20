// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:potofolios/UI/Home/Profilescreen.dart';
import 'package:potofolios/UI/Home/searchbar.dart';
import 'package:potofolios/UI/Loginsignup/model/user_model.dart';

import 'Drawer.dart';
import 'components/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  screenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  screenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Dawer(),
      backgroundColor: Colors.blue[50],
      key: _scaffoldKey,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenheight(context) / 3,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        child: Icon(Icons.list_outlined,
                            size: 30, color: Colors.white),
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        }),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child:
                            Icon(Icons.search, size: 30, color: Colors.white),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Searchbar()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Icon(Icons.notifications,
                            size: 30, color: Colors.white),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20),
                child: Row(
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'roboto',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Text(
                      '${loggedInUser.username}',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'times new roman',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      // enableInfiniteScroll: false,
                      height: 100,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      reverse: false,
                      aspectRatio: 16.0 / 9.0,
                    ),
                    itemBuilder: (context, i, id) {
                      //for onTap to redirect to another screen
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          //ClipRRect for image border radius
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageList[i],
                              width: 350,
                              // height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: screenwidth(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 4))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                          child: Image(
                            image: AssetImage('assets/icon/add.png'),
                            width: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
      // floatingActionButton: Container(
      //   child: Row(
      //     children: [Text("Add Profile")],
      //   ),
      //   width: 120,
      //   height: 50,
      //   decoration: BoxDecoration(
      //       color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      // ),
    );
  }
}
