import 'package:flutter/material.dart';
import '../Utils/Tag.dart';

class Tags extends StatefulWidget {

  @override
  _TagsState createState() => new _TagsState();
}

class _TagsState extends State<Tags> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Tag("Yoga"),
            new Tag("Natation")
          ],
        ),
      ),
    );
  }
}