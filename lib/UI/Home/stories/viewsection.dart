// ignore_for_file: use_key_in_widget_constructors prefer_const_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:potofolios/UI/Home/components/constants.dart';

class ExpandedTile extends StatefulWidget {
  final String title;
  final String subtitle;

  const ExpandedTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 2,
      margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          textColor: Colors.blue,
          iconColor: Colors.blue,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 25,
                    ),
                    // Icon(
                    //   Icons.file_present,
                    //   color: Colors.blue,
                    // )
                  ],
                ),
              ),
              Divider(),
            ],
          ),
          trailing: SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _custemfield('Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _custemfield('Father Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _custemfield('Phone Number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _custemfield('Address'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _custemfield(String helpertext) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: screenwidth(context) * .8,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.delete),
            hintText: helpertext,
            fillColor: Colors.blue.withOpacity(.2),
            filled: true),
      ),
    );
  }
}
