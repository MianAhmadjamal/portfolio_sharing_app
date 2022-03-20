// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

import 'components/constants.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

//1stbar category

String dropdownvalue = 'Category';
var items = [
  'Category',
  'Civil Engineer',
  'Mechanical Engineer',
  'Electrical Engineer',
  'Doctor',
  'Computer expert'
];

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenheight(context) / 7,
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
                padding: const EdgeInsets.only(top: 40.0, left: 10),
                child: Row(
                  children: [
                    Container(
                      child: DropdownButton(
                          dropdownColor: Colors.lightBlue,
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white,
                          ),
                          iconSize: 20,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          value: dropdownvalue,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Times new roman',
                                      fontSize: 12,
                                      color: Colors.white),
                                ));
                          }).toList(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              dropdownvalue = newvalue!;
                            });
                          }),
                      width: screenwidth(context) / 8 * 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 5, bottom: 2),
                        child: TextField(
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              hintText: 'Search Profile Here',
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      width: screenwidth(context) / 8 * 5.3,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
