import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackQC19',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flash'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                flashCard,
              ],
            ),
          ),
        );
        return scaffold;
  }
}

Widget flashCard = Container(
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/piscine.jpg'),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'TITRE DE l\u0027EVENEMENT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              )
              ),
            infoImportanteSection
          ],
        )
        )
    ],
    )
);


Widget infoImportanteSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      construireInfo(Colors.blueAccent, Icons.access_time, '13h00'),
      construireInfo(Colors.blueAccent, Icons.location_on, 'Complexe Desjardins'),
      construireInfo(Colors.blueAccent, Icons.date_range, '3 avril 2019')
    ],
  ),
);


Column construireInfo(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }