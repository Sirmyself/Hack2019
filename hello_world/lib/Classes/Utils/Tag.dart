import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  final String titre;
  
  @override
  _TagState createState() => new _TagState();

  Tag(this.titre);
}

class _TagState extends State<Tag> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.all(
          const Radius.circular(25)
          ),
        ),
        child: Text(widget.titre),
      ),
    );
  }
}