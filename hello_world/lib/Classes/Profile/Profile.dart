import 'package:flutter/material.dart';
import 'package:hello_world/flashCard.dart';
import '../Utils/Tags.dart';
import '../Utils/Tag.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blue)
        ),
        margin: EdgeInsets.all(15),
        child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 190,
            height: 190,
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.blue),
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
              )
            ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
          ),
          child: Text(
            "John Doe",
            textScaleFactor: 1.5)
        ),
        location("Québec")
        ]
      )
      )
    );
  }
}