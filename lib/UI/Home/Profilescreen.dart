// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/material.dart';
import 'package:potofolios/UI/Home/stories.dart';

import 'components/constants.dart';
import 'stories/stroeyconstant.dart';
import 'stories/viewsection.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenheight(context) / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80')),
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
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenheight(context) / 5 * .6),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: ClipRRect(
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/avatar.png'),
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    // backgroundImage: AssetImage(
                    //   'assets/avatar.png',
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: _stories(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Storeyviewscreen()));
                    }),
                  ),
                  ExpandedTile(
                    title: 'Personal Information ',
                    subtitle: 'Make Sure to Provide Correct Information',
                  ),
                  ExpandedTile(
                    title: 'Educational Information ',
                    subtitle: 'Make Sure to Provide Correct Information',
                  ),
                  ExpandedTile(
                    title: 'Experience Information ',
                    subtitle: 'Make Sure to Provide Correct Information',
                  ),
                  ExpandedTile(
                    title: ' Information ',
                    subtitle: 'Make Sure to Provide Correct Information',
                  ),
                  ExpandedTile(
                    title: 'Personal Information ',
                    subtitle: 'Make Sure to Provide Correct Information',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Stories
_stories(goto) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 0),
          child: Column(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFe9eaec)),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 33,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 75,
                child: Align(
                    child: Text(
                  'Your Story',
                  overflow: TextOverflow.ellipsis,
                )),
              )
            ],
          ),
        ),
        Row(
            children: List.generate(storyList.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: goto,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        storyList[index]['hasStory']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                storyList[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            storyList[index]['imageUrl']),
                                        fit: BoxFit.cover)),
                              ),
                        storyList[index]['isOnline']
                            ? Positioned(
                                top: 38,
                                left: 42,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF66BB6A),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xFFFFFFFF), width: 3)),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    storyList[index]['name'],
                    overflow: TextOverflow.ellipsis,
                  )),
                )
              ],
            ),
          );
        }))
      ],
    ),
  );
}

//Stories view
