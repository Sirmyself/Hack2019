import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackQC19',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:Home(),
      // home: MyHomePage(title: 'Flash'),
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
  margin: EdgeInsets.all(15),
  padding: EdgeInsets.all(15),
  decoration: new BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.blueAccent[100],
        blurRadius: 20,
        spreadRadius: 5,
        offset: Offset(10, 10),
      )
    ],
    borderRadius: new BorderRadius.all(
      const Radius.circular(25)
    ),
    border: new Border.all(color: Colors.white),
    color: Colors.white
  ),
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
                'Baignade libre',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              )
              ),
            location,
            infoImportanteSection
          ],
        )
        )
    ],
    )
);

Widget flashCardSwipe = Container(
  child: flashCard,
);

Widget infoImportanteSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      construireInfo(Colors.blueAccent, Icons.date_range, '3 avril 2019'),
      construireInfo(Colors.blueAccent, Icons.access_time, '13h00'),
      construireInfo(Colors.blueAccent, Icons.attach_money, '5.00 \u0024')
    ],
  ),
);

Widget location = Container(
  padding: EdgeInsets.only(left: 10, bottom: 10),
  child: Row(
    children: [
      Icon(Icons.location_on, color: Colors.blueAccent),
      Text('Complexe sportif Desjardins, Rimouski', style: TextStyle(color: Colors.blueAccent),)
    ],
  ),
);

Column construireInfo(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 35.0,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }