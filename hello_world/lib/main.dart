import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'flashCards_section_alignment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackQC19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
      // home: MyHomePage(title: 'Flash'),
    );
  }
}

class FlashCardSwipe extends StatefulWidget {

  @override
  _FlashCardSwipeState createState() => new _FlashCardSwipeState();
}

class _FlashCardSwipeState extends State<FlashCardSwipe> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new CardsSectionAlignment(context),
          Row(
            
          )
        ],
      ),
    );
  }
}